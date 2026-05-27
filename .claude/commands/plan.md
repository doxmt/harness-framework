---
description: 다음 작업의 세부 계획 수립 (planner → analyst, explore, writer)
argument-hint: ""
allowed-tools: Read, Agent
---

다음 파일들을 읽어 컨텍스트를 파악하라 (없으면 건너뜀):

- `docs/roadmap.md` — 전체 구현 순서
- `docs/current_state.md` — 현재 작업 상태

파악한 컨텍스트를 바탕으로 planner 에이전트를 호출하라.
planner가 사용자와 인터뷰를 진행하며 `docs/plans/{task}.md`를 생성할 것이다.
