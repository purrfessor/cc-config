---
name: research
description: Conduct comprehensive technical research with multi-agent validation and deliver focused, actionable proposals
argument-hint: <problem-description> [task-id] | <task-id> | "<specific-question>"
---

# Research Command

## Purpose
Orchestrate specialized agents to conduct thorough technical research, analyze problems, and deliver laser-focused proposals with validated recommendations.

## Research Workflow

### 1. Context Gathering
**Only when task ID is provided:**
- Retrieve requirements, constraints, and acceptance criteria
- Identify stakeholders and existing discussions

### 2. Initial Problem Analysis
**Deploy @agent-analyst to:**
- Analyze the problem space and identify core challenges
- Hypothesize potential solution approaches
- Create a focused research agenda with specific areas to investigate
- Identify key technical questions that need answers
- Determine what information would be most valuable for solution design

### 3. Targeted Technical Research
**Deploy @agent-technology-researcher with the research agenda to:**
- Investigate the specific areas identified by the analyst
- Research current best practices for the identified challenges
- Analyze relevant technologies, libraries, and frameworks
- Research similar implementations and case studies
- Answer the key technical questions posed by the analyst
- Identify potential challenges and edge cases

### 4. Solution Analysis & Proposal
**Deploy @agent-analyst to synthesize research into:**
- **Core Solution**: Laser-focused approach addressing the specific problem
- **Architecture Overview**: High-level design if applicable
- **Implementation Strategy**: Phased approach with clear milestones
- **Risk Assessment**: Technical challenges and mitigation strategies
- **Adjacent Considerations**: Related improvements worth considering
- **Trade-offs**: Clear articulation of pros/cons for key decisions

### 5. Peer Review & Validation
**Select 1-3 relevant agents based on problem domain:**
- @agent-backend-engineer for backend architecture
- @agent-frontend-engineer for UI/UX considerations  
- @agent-security-auditor for security implications
- @agent-system-architect for system design
- @agent-qa-engineer for testing strategy
- @agent-devops-engineer for deployment/infrastructure

**Review Focus:**
- Critical issues only - no nitpicking
- Validate technical feasibility
- Confirm security and performance considerations
- Identify genuine blockers or risks
- Explicitly state if no issues found

### 6. Proposal Refinement
**If critical feedback received:**
- Re-engage @agent-analyst to address concerns
- Incorporate valid criticisms into revised proposal
- Document why certain feedback was not incorporated

### 7. Delivery Format

**For standard research (< 500 lines):**
Present inline with structured sections:
```
## Executive Summary
[2-3 sentences capturing the essence]

## Context & Problem Statement
[What we're solving and why]

## Proposed Solution
[Core approach with key implementation details]

## Key Recommendations
1. [Primary recommendation]
2. [Secondary consideration]
3. [Optional enhancement]

## Validation Summary
[Brief note on peer review outcomes]
```

**For comprehensive research (> 500 lines):**
Save to `research_[timestamp].md` with full documentation including:
- Detailed technical specifications
- Implementation roadmap
- Complete risk analysis
- Alternative approaches considered
- Full peer review feedback

## Quality Standards

### Research Depth
- **Comprehensive**: Cover all relevant aspects
- **Current**: Use latest information and best practices
- **Practical**: Focus on implementable solutions
- **Evidence-based**: Support recommendations with data

### Proposal Clarity
- **Laser focus**: Address the specific problem first
- **Actionable**: Provide clear next steps
- **Measurable**: Include success criteria
- **Realistic**: Consider constraints and resources

### Validation Rigor
- **Selective**: Only engage agents relevant to the problem
- **Critical**: Focus on real issues, not hypothetical concerns
- **Constructive**: Provide solutions, not just problems
- **Honest**: Explicitly state when no issues are found

## Output Guidelines
- Start with what matters most to the user
- Use bullet points for clarity
- Include code examples where helpful
- Provide links to relevant documentation
- Quantify improvements where possible
- Always timestamp the research output

## Success Metrics
A successful research output will:
- Directly solve the stated problem
- Provide clear implementation guidance
- Include validated technical recommendations
- Anticipate and address likely challenges
- Deliver value beyond the immediate ask