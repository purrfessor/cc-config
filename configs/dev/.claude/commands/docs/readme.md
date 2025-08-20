---
name: readme:update
description: Generate or update README file for single repository projects with internal documentation focus
---

# README Generator for Single Repositories

Generate or update README files for single repository projects, focusing on practical internal documentation.

## Overview

This command analyzes your repository structure and creates/updates a comprehensive README with essential information for developers.

## Process

1. **Analyze Repository Structure**
   - Identify project type and main technologies
   - Detect build systems, test frameworks, CI/CD setup
   - Map out directory structure and key components

2. **Generate/Update README**
   - Repository overview and purpose
   - Setup and installation instructions
   - Local development workflow
   - Testing instructions
   - CI/CD pipeline information
   - Key features and APIs

## Instructions for Claude

When executing this command:

1. First, use the `analyst` agent with the following prompt: "Conduct a comprehensive analysis of this repository:

   STRUCTURE ANALYSIS:
   - What type of project is this (language, framework, architecture)?
   - List all major directories and their purposes
   - Identify all build tools, test frameworks, linters, formatters
   - Analyze CI/CD configuration files (GitLab CI, GitHub Actions, etc.)
   - Detect package managers and dependency files
   
   EXISTING DOCUMENTATION AUDIT:
   - Does a README already exist? If so, analyze:
     * Is the content up-to-date with the actual code?
     * Are all mentioned commands actually working?
     * Are the listed dependencies accurate and complete?
     * Do the version numbers match package.json/requirements.txt/etc.?
     * Are there any broken links or references?
   
   DEPENDENCY VERIFICATION:
   - List all runtime dependencies
   - List all development dependencies
   - Check for version mismatches or missing dependencies
   - Identify any system-level prerequisites
   
   COMMAND VALIDATION:
   - Extract all bash/shell commands from existing README
   - Check which commands are still valid vs outdated
   - Identify missing essential commands (install, test, build, lint, run)
   - Note any commands that require specific environment setup
   
   KEY FEATURES DISCOVERY:
   - What are the main features/functionalities of this project?
   - Identify the top 5-10 business logic components
   - Find the primary entry points and APIs
   - Note any important configuration options
   
   GAPS AND IMPROVEMENTS:
   - What critical information is missing from current documentation?
   - Which sections are outdated or misleading?
   - What new features lack documentation?
   - Are there undocumented environment variables or configs?
   
   Please provide specific examples and exact file paths for all findings."`

2. Create/update the README.md with:
   ```markdown
   # [Project Name]

   ## Overview
   [Brief description of what this project does and its purpose]

   ## Architecture
   [High-level architecture description - main components and how they interact]

   ## Directory Structure
   ```
   [Key directories and their purposes]
   ```

   ## Prerequisites
   [System requirements and dependencies]

   ## Setup & Installation
   ```bash
   # Step-by-step installation commands
   ```

   ## Configuration
   [Environment variables, config files, and their purposes]

   ## Local Development
   ```bash
   # How to run the project locally
   ```

   ## Testing
   ```bash
   # How to run tests
   # Include unit tests, integration tests, linting
   ```

   ## Key Features & APIs
   [Top 5-10 main functionalities with brief usage examples]

   ## Build & Deploy
   ```bash
   # Build commands
   ```
   [Deployment process and CI/CD pipeline information]

   ## Troubleshooting
   [Common issues and their solutions]

   ## Additional Resources
   [Links to related documentation, if any]
   ```

3. Focus on practical information:
   - Skip license, contributing guidelines, and other OSS boilerplate
   - Include actual working commands and paths
   - Document all environment variables and configuration options
   - Add troubleshooting tips for common issues
   - When updating existing READMEs, preserve useful content and only update outdated sections
   - Be concise but complete - aim for clarity
   - Always verify commands actually work before including them

4. Special considerations:
   - For web projects, include how to access the application (ports, URLs)
   - For CLI tools, include usage examples
   - For libraries, include code examples
   - For services, include API documentation references
   - Always double-check that test commands are accurate

Remember: Keep documentation practical and developer-focused. Always review existing README before updating to avoid losing valuable information. Verify all commands and dependencies are accurate.