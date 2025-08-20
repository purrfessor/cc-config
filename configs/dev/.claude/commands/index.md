---
name: index
description: Build a comprehensive repository index with CLAUDE.md index files (Claude memory) in each code directory
---

# Repository Map Command

## General
    This process exists to help you maintain the context in a more nuanced and detailed way,
    allowing you to travel a tree of memories in each directory where you will store your memories about the code in a
    form of index.

## Workflow
0. Always start by reading the latest memory documentation: https://docs.anthropic.com/en/docs/claude-code/memory
1. Resolve TARGET = $ARGUMENTS[0] or repo root.
2. Build checklist DIRS = all sub-dirs of TARGET
- Include ONLY directories (DIR/**/*) that contain code files (.py, .java, .ts, etc.)
- Exclude .git, venv, dist, build, and any hidden dirs
3. For each DIR in DIRS:
a. Check if `DIR/CLAUDE.md` exists
b. If exists: Read existing CLAUDE.md and verify its accuracy
   - Parse existing sections (purpose, public, contracts, deps, etc.)
   - Read ALL code files in `DIR/**/*` to verify current state
   - Compare existing documentation with actual code
   - Update only the sections that are outdated or incomplete
   - Preserve any valuable notes or context that still applies
   - Update last_updated timestamp
c. If not exists: Create new CLAUDE.md with the template below
d. Continue until every DIR in the checklist has an accurate CLAUDE.md
4. Verify: counted CLAUDE.md files == len(DIRS). If mismatch, list dirs
missing an index and repeat step 3 for them.
5. Print a final summary:
"Updated/Created N CLAUDE.md files under <TARGET>; all directories indexed."
Make sure to keep the summary concise, only write the message above and nothing else.

If the directory list is too big (>15 folders):
1. You can create a temporary MD document for a checklist that you will maintain between interacting with user. Delete
it afterwards.
2. You can delegate different directories mapping to subagents. For that, use the Task tool. <b>Run multiple Task invocations in a SINGLE message to run subagents truly in parallel</b>.

## Example

```yaml
dir: transport/popsell                     # full relative path
purpose: >
   Transport layer that batches PopSell business‑event objects and delivers
   them to the API with retry/back‑pressure logic.

public:                                    # the surface interfafces and methods of the package
   PopSellTransport:
      role: Facade; queues, flushes, and retries
      signature: (client: PopSellClient, buffer: int = 100) -> None
   PopSellClient:
      role: Thin HTTP wrapper around the vendor REST API
      signature: (base_url: str, timeout: float = 2.5) -> None
   build_event():
      role: Helper that serialises a domain object into JSON
      signature: (event: ‘Event’) -> dict

contracts:                                 # data crossing directory boundaries
   EventPayload:
      schema: {id:str, occurred_at:datetime, attributes:dict[str,Any]}
   BatchResponse:
      schema: {accepted:int, rejected:int, errors:list[str]}

deps:                                       # import awareness
   internal: [common.retry, utils.logging]
   external: [aiohttp, redis]

ai-pitfalls:                                   # Typical agentic coding issues you identified in the package. Keep no more than 5.
   - **dead‑code**: `legacy_*.py` kept for reference, not executed
   - **production‑mocks**: `mock_popsell.py` fakes remote API inside build scripts
   - **duplicated‑logic**: event batching exists also in `db/event_sink.py`
   - **partial‑impl**: `PopSellTransport.flush_async()` has TODO

notes: # Keep no more than 8 notes at a time
  - Batch size was tuned for poor cellular networks (see issue TASK-123). Consider switching to adaptive batching once QoS metrics are in place. 

last_updated: 2025‑07‑22T13:45:08Z
```