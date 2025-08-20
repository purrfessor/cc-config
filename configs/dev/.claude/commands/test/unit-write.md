---
name: test:write-unit-tests
description: Generate a lean, high‑impact unit‑test suite for the specified class, file or package.
argument-hint: <file-path/dir-path/class-name> [specific-methods-to-focus-on]
---

# Objective  
Write **maintainable, efficient unit tests** for `$ARGUMENTS`, focusing on real business logic, critical paths, and realistic edge cases while keeping the **coverage:effort ratio** optimal. Then **execute and verify** the tests work properly.

# Phase 1: Test Design & Implementation

## Guidelines  
1. **Analyze first** – map the API, invariants, and failure modes; target what truly matters
2. **Design tests for behaviour** – favour *Arrange/Act/Assert* style; mock or stub **only** when collaborators obscure the assertion
3. **Cover what counts** – success paths, boundary conditions, error handling, concurrency/race situations, and any domain‑specific "gotchas" 
4. **Keep it tidy** – clear test names, shared fixtures, helpers/builders; follow existing project layout  
5. **Verify thoroughly** – assert outputs, side‑effects, emitted events, and exception details  

# Phase 2: Test Execution & Verification

## Configuration Check
1. **Verify test setup** – ensure test framework is installed, test directories exist, and configuration files are properly set
2. **Check dependencies** – confirm all test dependencies and mocks are available
3. **Validate paths** – ensure test discovery paths are correctly configured

## Execution Steps
1. **Run the tests** – execute the newly written tests using the appropriate test runner
2. **Capture results** – record pass/fail status, execution time, and any error messages
3. **Fix failures** – if tests fail due to:
   - Configuration issues: update test setup files
   - Missing dependencies: install required packages
   - Environmental issues: adjust test fixtures or mocks
   - Actual bugs: note them for the user but don't fix source code
4. **Re-run after fixes** – ensure all tests pass after addressing issues

## Verification Report
After successful execution, provide:
- **Execution summary** – total tests run, passed, failed, skipped
- **Performance metrics** – execution time for test suite
- **Configuration changes** – any setup modifications made
- **Coverage summary** – scenario coverage and remaining risk areas (≤6 lines)
- **Next steps** – recommendations for CI integration or additional test scenarios

# Phase 3: Final Validation
1. **Clean run** – execute entire test suite one final time to ensure stability
2. **Documentation** – note any special setup requirements or gotchas
3. **Integration ready** – confirm tests are ready for CI/CD pipeline inclusion
