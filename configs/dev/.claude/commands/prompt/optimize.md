---
name: optimize-prompt
description: Optimize prompts for clarity and conciseness while preserving functionality
argument-hint: <prompt-file-path> [specific-sections-to-focus-on]

---

# Optimize Prompt Command

**Important**: This task must be delegated to @agent-prompt-engineer.

## Task

Analyze and optimize the provided prompt to create a more concise, effective version that follows Claude 4 best practices.

## Requirements

1. **Preserve Core Functionality**
   - Maintain all critical instructions and capabilities
   - Keep essential context and constraints
   - Retain the prompt's original intent

2. **Optimize for Clarity**
   - Remove redundant or repetitive instructions
   - Consolidate similar concepts into unified sections
   - Use direct, actionable language
   - Eliminate verbose explanations where patterns are clear

3. **Apply Claude 4 Best Practices**
   - Be explicit about expectations
   - Structure information logically
   - Focus on what TO do (not what to avoid)
   - Use clear section headers and formatting

4. **Provide Analysis**
   - Explain what was changed and why
   - Highlight any potential trade-offs
   - Note which sections were consolidated or removed
   - Estimate reduction in token count

## Output Format

1. **Optimized Prompt**: The concise, improved version
2. **Change Summary**: Brief explanation of optimizations made
3. **Metrics**: Original vs. optimized token count (estimate)

## Example Focus Areas

- Combining overlapping instructions
- Removing unnecessary examples when patterns are established
- Consolidating decision frameworks
- Simplifying complex explanations
- Eliminating redundant quality standards

Remember: The goal is maximum clarity with minimum tokens while preserving all essential functionality.