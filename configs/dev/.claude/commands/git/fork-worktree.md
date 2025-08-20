---
name: fork
description: Create git worktrees for parallel development with automatic Claude configuration copying
---

# Fork Command

## Overview
Create isolated git worktrees in separate branches for experimental or parallel work.

## Additional guidance

```
$ARGUMENTS
```

Extract from the guidance:
- Multiple tasks (do not solve the tasks themselves, your scope is to just create the worktrees)
- Skip confirmations or not

## Workflow

1. **Parse arguments**
   - Check for `--yes` or `-y` flag to skip confirmations
   - Extract task list if comma-separated values provided
   - If no tasks provided, treat as single worktree creation

2. **Validate prerequisites**
   - Check if current directory is a git repository
   - Get current branch name to extract task ID (before first `/`)

3. **For each task (or single execution)**:
   
   a. **Get user input** (skip if `--yes` flag present)
      - Ask for worktree location:
        - `(i)` Inside project: `$projectDir/worktree-$branchName`
        - `(o)` Outside project: `$projectDir/../worktree-$branchName`
      - Default to `(o)` if auto-confirming

   b. **Generate branch name**
      - Format: `$taskId/$taskShortName-$timestamp`
      - Extract `$taskId` from current branch (before first `/`)
      - Generate `$taskShortName` by the task description
      - Add `$timestamp` (Unix timestamp) for uniqueness

   c. **Create worktree**
      - Create new branch: `git checkout -b $branchName`
      - Create worktree: `git worktree add $worktreePath $branchName`
      - Verify creation was successful
      
   d. **Copy Claude configuration**
      - Copy `.claude/` directory if exists in main worktree
      - Copy `CLAUDE.local.md` if exists in main worktree
      - Preserve file permissions and structure
      - Skip if files already exist in worktree

4. **Report results**
   - Show summary of all created worktrees
   - Display branch names and paths
   - Provide usage instructions

## Error Handling
- Not a git repo: Exit with clear error
- Dirty working tree: Suggest commit first
- Branch exists: Suggest alternative name
- Path exists: Suggest cleanup or different location