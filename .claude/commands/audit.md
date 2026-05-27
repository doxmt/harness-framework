---
description: 전체 코드베이스 보안 감사 + 코드 단순화 (security-reviewer → code-simplifier)
argument-hint: ""
allowed-tools: Agent
---

전체 코드베이스를 대상으로 아래 순서대로 실행하라.

1. security-reviewer 에이전트를 호출하여 보안 취약점을 감사하라. 결과를 사용자에게 보고하라.
2. code-simplifier 에이전트를 호출하여 과도한 복잡도와 불필요한 추상화를 제거하라. 커밋은 하지 않는다.
