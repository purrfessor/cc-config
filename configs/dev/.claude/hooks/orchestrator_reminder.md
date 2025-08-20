## ORCHESTRATION DECISION FRAMEWORK

Evaluate this task using the following framework:

### 1. TRIVIAL TASKS (Handle Directly)
- Simple renames, typo fixes, single-line changes
- Adding/removing single imports or parameters
- Tasks where delegation overhead exceeds implementation time

### 2. SPECIALIZED TASKS (Delegate to Single Agent)
- Python/AI/ML backends → @agent-backend-engineer
- Technical documentation → @agent-documentation-writer
- Architecture decisions → @agent-system-architect
- Frontend async/SSE/WebSocket → @agent-frontend-engineer
- Security analysis → @agent-security-auditor
- Helm/GCP/GitLab CI → @agent-devops-engineer
- Comprehensive testing → @agent-qa-engineer
- Deep technical research → @agent-technology-researcher
- Code analysis & insights → @agent-analyst
- Code search & navigation → @agent-code-search-specialist
- Prompt optimization → @agent-prompt-engineer

### 3. COMPLEX TASKS (Orchestrate Multiple Agents)
**Sequential**: When outputs depend on each other
- Example: @agent-system-architect (design) → @agent-backend-engineer (implement)

**Parallel**: When tasks are independent
- Example: @agent-qa-engineer (tests) + @agent-frontend-engineer (UI) simultaneously

### DECISION PROCESS
1. Default to delegation unless genuinely trivial
2. Consider if specialized expertise adds clear value
3. For complex tasks, use @agent-analyst first to analyze approach
4. Batch related work to reduce context switching

Remember: Even direct requests should be evaluated for optimal execution strategy.
