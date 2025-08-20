---
name: review:backend
description: Conduct multi-perspective code review using specialized agents for architecture, security, backend, QA, and ML
argument-hint: <focus areas/branch/files>
---

# Backend Review Command

**CRITICAL**: Launch ALL agents in PARALLEL (single message, multiple Task tool calls). Each agent MUST save output to file.

## Execution Steps

### 1. Setup
Create directories:
- `.claude/review/subagent-reports/` (agent outputs)
- `.claude/review/shared-context/` (optional shared docs)

Default scope: diff current→master (unless user specifies)

### 2. Context gathering [OPTIONAL]
This is an optional step. **Only do this if the conditions are met** (each point must be considered separately):
- if the changes are related to work with certain frameworks or libraries, you can use @agent-technology-researcher to gather additional context
Save the findings to the source.

### 3. Parallel Agent Launch

**⚡ PARALLEL EXECUTION REQUIREMENT**: Run multiple Task invocations in a SINGLE message. DO NOT launch sequentially.

**Agents to launch simultaneously (with critical focus areas):**
- **system-architect**: Design flaws, coupling issues, scalability bottlenecks, architectural debt → `architect-review.md`
- **security-auditor**: Vulnerabilities, exposure risks, authentication gaps, data leaks → `security-review.md`  
- **backend-engineer**: Performance problems, concurrency bugs, API design flaws, error handling gaps → `backend-review.md`
- **qa-engineer**: Test gaps, untested edge cases, brittle tests, quality risks → `qa-review.md`
- **use your judgement**: if you think that the implemented feature requires attention of some other subagent in your disposal, use them as well

**Agent context** (same for all):
```
Review code: [scope/diff]
User request: $ARGUMENTS

🔍 CRITICAL ANALYSIS MANDATE:
- PRIORITIZE problem detection over positive commentary
- Apply SKEPTICAL analysis - assume issues exist until proven otherwise
- Flag GENUINE problems only - avoid false positives
- Question design decisions, implementation choices, and assumptions
- Look for what could break, fail, or cause issues in production
- Challenge optimistic assumptions and happy-path thinking

MANDATORY: Save complete findings to .claude/review/subagent-reports/[your-filename].md
Check .claude/review/shared-context/ for additional docs
Every finding needs exact file:line reference
```

### 4. Agent Output Requirements

**🔴 MANDATORY FILE SAVE**: Not saving to `.claude/review/subagent-reports/{filename}.md` = INCOMPLETE TASK

**Required format:**
```markdown
# [Role] Review Report
Date: [ISO-8601]
Scope: [what reviewed]

## Summary
[Key findings overview]

## Findings
### 🚨 Blockers / ⚠️ Critical / 🔸 Major / 🔹 Minor / 💡 Suggestions
#### [Issue]
**Location**: `file:line` (REQUIRED)
**Evidence**: [code snippet]
**Risk Analysis**: [what could fail, break, or cause problems]
**Impact**: [business/technical consequences if not addressed]
**Fix**: [concrete solution with implementation guidance]

## Critical Assessment
[Problem patterns, systemic issues, areas of concern requiring attention]
```

### 4. Consolidation

After ALL agents complete:
1. Read all `.claude/review/subagent-reports/*.md`
2. Merge by severity, preserve exact content
3. Identify cross-cutting problems and systemic issues
4. Save to `.claude/review/final-report.md`:

```markdown
# Code Review Report
Date: [timestamp]
Branch: [info]

## Executive Summary
[Count by severity, critical problem themes, risk assessment]

## Critical Analysis Overview
[Cross-cutting issues, systemic problems, priority risks requiring immediate attention]

## All Findings by Severity
### 🚨 Blockers
[Copy verbatim with "— via Agent" attribution]

### ⚠️ Critical
[Copy verbatim with "— via Agent" attribution]

### 🔸 Major
[Copy verbatim with "— via Agent" attribution]

### 🔹 Minor
[Copy verbatim with "— via Agent" attribution]

### 💡 Suggestions
[Copy verbatim with "— via Agent" attribution]

## Individual Reports
[Links to agent reports]
```

## Success Criteria
✓ Agents launched in parallel (one message)
✓ Every agent saves to file
✓ All findings have file:line references
✓ Final consolidated report created

Proceed with review: $ARGUMENTS