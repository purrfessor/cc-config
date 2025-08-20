---
name: readme:update-mono
description: Generate or update README files for monorepo projects with internal documentation focus
---

# README Generator for Monorepos

Generate or update README files for monorepo projects, focusing on practical internal documentation.

## Overview

This command analyzes your monorepo structure and creates/updates README files at both root and project levels with essential information.

## Process

1. **Analyze Repository Structure**
   - Identify monorepo type (npm workspaces, lerna, yarn workspaces, etc.)
   - Map out all projects/packages
   - Detect build systems, test frameworks, GitLab CI setup (if present)

2. **Generate Root README**
   - Repository overview and architecture
   - Global setup and installation instructions
   - How to run the entire project locally
   - GitLab CI pipeline information
   - Directory structure overview

3. **Generate Project-Specific READMEs**
   - Project/module purpose and functionality
   - Local development setup (if runnable independently)
   - Main packages and dependencies
   - Top 5 Key business-logic features and APIs
   - Testing instructions specific to the module (always double-check)

## Instructions for Claude

When executing this command:

1. First, use the `analyst` agent with the following prompt: "Conduct a comprehensive analysis of this monorepo:

   STRUCTURE ANALYSIS:
   - What type of monorepo is this (maven, npm workspaces, lerna, yarn, nx, rush, etc.)?
   - List ALL projects/packages with their exact paths
   - Map the dependency graph between internal packages
   - Identify all build tools, test frameworks, linters, formatters
   - Analyze GitLab CI configuration files
   
   EXISTING DOCUMENTATION AUDIT:
   - List all existing README files and their locations
   - For each README, analyze:
     * Is the content up-to-date with the actual code?
     * Are all mentioned commands actually working?
     * Are the listed dependencies accurate and complete?
     * Do the version numbers match package.json/requirements.txt/etc.?
     * Are there any broken links or references?
   
   DEPENDENCY VERIFICATION:
   - Compare documented dependencies vs actual package.json/pyproject.toml/go.mod
   - Check if all runtime dependencies are documented
   - Verify dev dependencies that affect local development
   - Note any version mismatches or missing dependencies
   
   COMMAND VALIDATION:
   - Extract all bash/shell commands from existing READMEs
   - Check which commands are still valid vs outdated
   - Identify missing essential commands (install, test, build, lint)
   - Note any commands that require specific environment setup
   
   GAPS AND IMPROVEMENTS:
   - What critical information is missing from current documentation?
   - Which sections are outdated or misleading?
   - What new features/modules lack documentation?
   - Are there undocumented environment variables or configs?
   
   Please provide specific examples and exact file paths for all findings."`

2. Create/update the root README.md with:
   ```markdown
   # [Repository Name]

   ## Overview
   [Brief description of what this monorepo contains]

   ## Architecture
   [High-level architecture description]

   ## Projects
   [Table or list of all projects with brief descriptions]

   ## Setup & Installation
   ```bash
   # Installation steps for the entire monorepo
   ```

   ## Local Development
   ```bash
   # How to run the entire system locally
   ```

   ## Testing
   ```bash
   # How to run all tests
   ```

   ## CI/CD Pipeline
   [GitLab CI or other pipeline information]
   ```

   **Note**: Keep all global setup, prerequisites, and environment configuration in this root README.

3. For each project/package, create/update its README.md:
   ```markdown
   # [Project Name]

   ## Purpose
   [What this module does - keep concise]

   ## Key Features
   [Top 5 main functionalities - brief bullet points]

   ## Local Development
   ```bash
   # Reference root README for global setup
   ```

   ## Main Packages
   [**Core** dependencies specific to this module]

   ## API/Usage
   [Key APIs or usage examples - focus on most important ones]

   ## Testing
   ```bash
   # Module-specific test commands only
   ```

   ## Build & Deploy
   [Module-specific build info only if different from global]
   ```

   **Important**: Do NOT duplicate installation guides, environment setup, or prerequisites that are already in the root README. Reference the root README instead.

4. Focus on practical information:
   - Skip license, contributing guidelines, and other OSS boilerplate
   - Include actual working commands and paths
   - Document environment variables and configuration
   - Add troubleshooting tips for common issues
   - When updating existing READMEs, preserve useful content and only update outdated sections
   - Be concise - aim for clarity over comprehensive coverage

Remember: Keep documentation concise but complete. Focus on what developers need to work with the code effectively. Always review existing READMEs before updating to avoid losing valuable information.