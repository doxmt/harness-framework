---
description: docs/current_state.md 를 읽어라.
argument-hint: ""
allowed-tools: Read, Bash(git:*), Bash(gh:*)
---

1. 프로젝트 문서 읽기 (없으면 건너뜀):
   - `docs/architecture.md`
   - `DESIGN.md`
   - `docs/prd.md`
   - `docs/adr.md`

2. `docs/current_state.md` 읽기 — 예정 목록에서 다음 작업을 확인하고 사용자에게 보여준 뒤, 이 작업을 시작할지 확인하라.

사용자가 확인하면:
3. `git pull origin develop` 으로 최신화하라
4. 작업 타입에 맞는 `.claude/skills/github/templates/` 템플릿을 참조해 이슈를 생성하라 (`.claude/skills/github/SKILL.md` 규칙 따름)
5. 생성된 이슈 번호로 브랜치를 만들고 이동하라
6. 1번에서 읽은 문서와 이슈 내용을 바탕으로 코드 구현을 시작하라. 커밋은 하지 않는다.

사용자가 수정하면:
수정된 내용으로 위 과정을 진행하라.
