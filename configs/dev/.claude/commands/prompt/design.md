---
name: design-prompt
description: Generate a task-specific prompt optimized for the simplest, most direct solution
argument-hint: <task-description> [specific-constraints-or-requirements]

---

# Design Prompt Command

I'll use the prompt-engineer agent to design a task-specific prompt optimized for the simplest, most direct solution.

## Task

Using the Task tool with subagent_type "prompt-engineer", create a high-quality, task-specific prompt that delivers the simplest and most direct solution to the user's described problem. The prompt should be laser-focused on the exact task requirements without unnecessary complexity or scope expansion.

**IMPORTANT**: The agent must save the generated prompt to a file when requested by the user. Use the Write tool to create the file with an appropriate name based on the task description.

The agent should be given the user's task description and any specific constraints or requirements, along with all the guidance below to ensure the output follows our core principles.

## Core Principles

1. **Simplicity First**
   - Generate prompts that lead to the most straightforward solution
   - Avoid feature creep and over-engineering
   - Focus on "what's needed" not "what's possible"

2. **Task Specificity**
   - Tailor the prompt precisely to the given task
   - Include only relevant context and constraints
   - Remove generic instructions that don't apply

3. **Direct Solutions**
   - Guide toward immediate problem-solving
   - Minimize intermediate steps when possible
   - Prioritize clarity over comprehensiveness

## Requirements

### Input Analysis
1. **Extract Core Objective**
   - Identify the primary goal
   - Determine success criteria
   - Understand constraints and limitations

2. **Assess Complexity**
   - Determine minimal viable solution
   - Identify essential vs. nice-to-have features
   - Flag any over-specification in the request

3. **Define Scope Boundaries**
   - What must be included
   - What should be explicitly excluded
   - Where to draw the line on edge cases

### Prompt Generation
1. **Structure**
   - Clear role definition (if needed)
   - Concise task statement
   - Essential context only
   - Specific output requirements
   - Minimal but sufficient examples

2. **Language Optimization**
   - Use direct, actionable instructions
   - Eliminate ambiguity
   - Focus on "do this" rather than "avoid that"
   - Keep sentences short and clear

3. **Claude 4 Best Practices**
   - Leverage the model's strengths
   - Use appropriate formatting (markdown, lists)
   - Include verification steps only when critical
   - Optimize for single-pass execution when possible

## Output Format

1. **Generated Prompt**
   - The complete, ready-to-use prompt
   - Formatted with clear sections
   - Optimized for the specific task

2. **Design Rationale**
   - Why this approach is the simplest solution
   - Key decisions made to maintain focus
   - What was intentionally excluded and why

3. **Usage Guidelines**
   - When to use this prompt
   - Expected output characteristics
   - Any critical parameters or variations

4. **Simplicity Metrics**
   - Estimated complexity level (simple/moderate/complex)
   - Token efficiency assessment
   - Single-pass success likelihood

## Example Scenarios

**Good Candidates for This Command:**
- "I need a prompt to extract dates from documents"
- "Create a prompt for summarizing meeting notes"
- "Design a prompt to validate JSON structures"

**Poor Candidates (Too Generic):**
- "Make a prompt for coding"
- "Create a general-purpose assistant"
- "Design a prompt that does everything"

## Anti-Patterns to Avoid

- Adding "just in case" instructions
- Including unrelated best practices
- Over-explaining concepts the model already knows
- Creating multi-purpose prompts when single-purpose would suffice
- Defensive programming in prompts (unless security-critical)

## Success Criteria

A well-designed prompt should:
- Solve exactly the stated problem
- Require minimal iterations to get right
- Produce consistent, predictable outputs
- Be understood at first reading
- Lead to the simplest viable solution

Remember: The best prompt is not the most comprehensive one, but the one that most efficiently achieves the specific goal.