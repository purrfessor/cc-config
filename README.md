# Claude Code Configuration System

A collection of reusable Claude Code configurations for different development contexts.

## Usage

### Option 1: Direct Use (No Installation)
```bash
cd configs/dev
claude
```
Run Claude directly from a config directory for temporary use without installing anything.

### Option 2: Install to Project
```bash
./install.sh dev /path/to/project
```
Installs the configuration to a specific project directory. This copies `.claude/` to the project and places `CLAUDE.md` in the project root.

### Option 3: Install Globally
```bash
./install.sh dev --global
```
Installs the configuration globally to `~/.claude/` with `CLAUDE.md` inside `~/.claude/`.

## Available Configurations

- **dev** - Development-focused configuration with common tools and workflows

## Features

- **Automatic MCP setup**: Uses `claude mcp add` commands to properly register MCP servers
- **Backup protection**: Creates timestamped backups before overwriting existing configurations
- **Clean installation**: Handles different file placement for project vs global installations

## Requirements

- Claude Code CLI
- `jq` (for MCP server configuration parsing)
