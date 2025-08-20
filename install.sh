#!/bin/bash

# Claude Code Configuration Installation Script
# Usage: 
#   ./install.sh <path> <config-name>        # Project installation
#   ./install.sh --global <config-name>     # Global installation

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print functions
print_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Show usage
show_usage() {
    echo "Usage:"
    echo "  $0 <path> <config-name>        # Install to project directory"
    echo "  $0 --global <config-name>     # Install globally to ~/.claude"
    echo ""
    echo "Examples:"
    echo "  $0 /my/project dev            # Install 'dev' config to /my/project"
    echo "  $0 --global dev               # Install 'dev' config globally"
    echo ""
    echo "Available configurations:"
    for config in "$SCRIPT_DIR/configs"/*; do
        if [ -d "$config" ]; then
            echo "  - $(basename "$config")"
        fi
    done
}

# Create backup with timestamp
create_backup() {
    local target_dir="$1"
    local backup_suffix="backup-$(date +%Y%m%d-%H%M%S)"
    
    if [ -d "$target_dir/.claude" ]; then
        print_info "Creating backup of existing .claude directory..."
        cp -r "$target_dir/.claude" "$target_dir/.claude.$backup_suffix"
        print_success "Backup created: $target_dir/.claude.$backup_suffix"
    fi
    
    # For project installations, also backup CLAUDE.md
    if [ "$target_dir" != "$HOME" ] && [ -f "$target_dir/CLAUDE.md" ]; then
        print_info "Creating backup of existing CLAUDE.md..."
        cp "$target_dir/CLAUDE.md" "$target_dir/CLAUDE.md.$backup_suffix"
        print_success "Backup created: $target_dir/CLAUDE.md.$backup_suffix"
    fi
    
    # For global installations, backup CLAUDE.md in ~/.claude
    if [ "$target_dir" = "$HOME" ] && [ -f "$HOME/.claude/CLAUDE.md" ]; then
        print_info "Creating backup of existing CLAUDE.md..."
        cp "$HOME/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md.$backup_suffix"
        print_success "Backup created: $HOME/.claude/CLAUDE.md.$backup_suffix"
    fi
}

# Install MCP servers using claude mcp add
install_mcp_servers() {
    local scope="$1"  # "user" for global, "project" for project
    local mcp_file="$2"
    
    if [ ! -f "$mcp_file" ]; then
        print_warning "No MCP configuration found, skipping MCP server installation"
        return
    fi
    
    if ! command -v jq &> /dev/null; then
        print_error "jq is required to parse MCP configuration. Please install jq first."
        return 1
    fi
    
    if ! command -v claude &> /dev/null; then
        print_error "Claude CLI not found. Please ensure Claude Code is installed and in PATH."
        return 1
    fi
    
    print_info "Installing MCP servers with scope: $scope"
    
    # Parse JSON and install each MCP server
    local servers=$(jq -r '.mcpServers | keys[]' "$mcp_file" 2>/dev/null || echo "")
    
    for server_name in $servers; do
        local server_type=$(jq -r ".mcpServers[\"$server_name\"].type" "$mcp_file")
        
        print_info "Installing MCP server: $server_name"
        
        if [ "$server_type" = "sse" ]; then
            local url=$(jq -r ".mcpServers[\"$server_name\"].url" "$mcp_file")
            if claude mcp add --transport sse -s "$scope" "$server_name" "$url" 2>/dev/null; then
                print_success "Installed SSE MCP server: $server_name"
            else
                print_error "Failed to install SSE MCP server: $server_name"
            fi
            
        elif [ "$server_type" = "stdio" ]; then
            local command=$(jq -r ".mcpServers[\"$server_name\"].command" "$mcp_file")
            local args=$(jq -r ".mcpServers[\"$server_name\"].args[]?" "$mcp_file" 2>/dev/null | tr '\n' ' ' | sed 's/[[:space:]]*$//')
            
            # Build command
            local full_command="claude mcp add -s $scope $server_name -- $command"
            if [ -n "$args" ]; then
                full_command="$full_command $args"
            fi
            
            if eval "$full_command" 2>/dev/null; then
                print_success "Installed STDIO MCP server: $server_name"
            else
                print_error "Failed to install STDIO MCP server: $server_name"
            fi
        else
            print_error "Unsupported MCP server type '$server_type' for server '$server_name'"
        fi
    done
}

# Main installation function
install_config() {
    local target_dir="$1"
    local config_name="$2"
    local is_global="$3"
    
    local config_dir="$SCRIPT_DIR/configs/$config_name"
    
    # Validate config exists
    if [ ! -d "$config_dir" ]; then
        print_error "Configuration '$config_name' not found in $SCRIPT_DIR/configs/"
        show_usage
        exit 1
    fi
    
    # Validate .claude directory exists in config
    if [ ! -d "$config_dir/.claude" ]; then
        print_error "Configuration '$config_name' is missing .claude directory"
        exit 1
    fi
    
    # Create backup
    create_backup "$target_dir"
    
    # Create target directory if needed
    mkdir -p "$target_dir"
    
    # Copy .claude directory
    print_info "Installing Claude Code configuration: $config_name"
    rm -rf "$target_dir/.claude"
    cp -r "$config_dir/.claude" "$target_dir/.claude"
    print_success "Installed .claude directory"
    
    # Handle CLAUDE.md placement
    if [ "$is_global" = "true" ]; then
        # Global installation: CLAUDE.md goes to ~/.claude/CLAUDE.md
        if [ -f "$config_dir/CLAUDE.md" ]; then
            cp "$config_dir/CLAUDE.md" "$target_dir/.claude/CLAUDE.md"
            print_success "Installed CLAUDE.md to ~/.claude/CLAUDE.md"
        fi
    else
        # Project installation: CLAUDE.md goes to project root
        if [ -f "$config_dir/CLAUDE.md" ]; then
            cp "$config_dir/CLAUDE.md" "$target_dir/CLAUDE.md"
            print_success "Installed CLAUDE.md to project root"
        fi
    fi
    
    # Install MCP servers
    local mcp_file="$config_dir/.mcp.json"
    if [ -f "$mcp_file" ]; then
        if [ "$is_global" = "true" ]; then
            install_mcp_servers "user" "$mcp_file"
        else
            # Change to target directory for project MCP installation
            local original_dir=$(pwd)
            cd "$target_dir"
            install_mcp_servers "project" "$mcp_file"
            cd "$original_dir"
        fi
    fi
    
    print_success "Configuration '$config_name' installed successfully!"
}

# Parse arguments
if [ $# -eq 0 ]; then
    print_error "No arguments provided"
    show_usage
    exit 1
fi

if [ "$1" = "--global" ]; then
    # Global installation
    if [ $# -ne 2 ]; then
        print_error "Global installation requires exactly one config name"
        show_usage
        exit 1
    fi
    
    config_name="$2"
    install_config "$HOME" "$config_name" "true"
    
elif [ $# -eq 2 ]; then
    # Project installation
    project_path="$1"
    config_name="$2"
    
    # Convert to absolute path
    if [ ! -d "$project_path" ]; then
        print_error "Directory does not exist: $project_path"
        exit 1
    fi
    
    project_path="$(cd "$project_path" && pwd)"
    install_config "$project_path" "$config_name" "false"
    
else
    print_error "Invalid arguments"
    show_usage
    exit 1
fi

print_info "Installation complete! Restart Claude Code for changes to take effect."