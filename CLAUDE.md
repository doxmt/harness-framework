# CLAUDE.md

@docs/architecture.md
@DESIGN.md

## Harness Template Note

이 파일과 `docs/architecture.md`, `docs/prd.md`, `docs/adr.md`, `DESIGN.md`는 새 프로젝트 초기화용 템플릿이다.
프로젝트를 시작할 때 이 하네스를 불러온 뒤, 플랜모드에서 확정된 계획을 바탕으로 중괄호 플레이스홀더를 채운다.
하네스 배포본에서는 플레이스홀더가 비어 있는 것이 정상이다.

## Project Context

{이 프로젝트를 작업할 때 헷갈리기 쉬운 핵심 맥락만 2-3줄}

## Non-Obvious Rules

- 터미널 멀티플렉서는 tmux가 아닌 **cmux**를 사용한다. tmux 명령어가 필요한 경우 cmux 동등 명령어로 대체하라.
- {코드만 보면 알기 어려운 프로젝트 고유 규칙}
- {Claude가 실수하면 안 되는 비즈니스/도메인 규칙}
- {기존 패턴과 다르게 보이지만 의도된 설계}
- {어떤 로직은 어디에만 둔다 — 파일/모듈 경계 포함}
- {직접 import하면 안 되는 모듈}
- {데이터 흐름/상태 관리/서버-클라이언트 경계}

## Agent Teams

Agent Teams가 활성화된 세션에서 사용자가 "팀 모드", "Agent Teams"라고 요청하거나 요청에 "conductor"를 포함하면 일반 Agent subagent 호출로 대체하지 않는다.

반드시 TeamCreate로 팀을 만든 뒤 conductor를 teammate로 spawn하고, 이후 필요한 작업자도 같은 팀의 teammate로 생성한다. conductor는 계획만 하며, team lead가 teammate 생성과 조율을 담당한다.

Agent Teams가 활성화되지 않은 세션에서는 conductor와 팀 관련 도구를 사용하지 않는다.

## Do Not

> 사용자가 반복 실수나 잘못된 가정을 지적하면, 다음 세션에서 반복하지 않도록 이 섹션에 짧게 추가한다.

- {반복적으로 하면 안 되는 실수}
- {수정하면 위험한 파일/패턴}
- {편해 보여도 금지된 우회 방식}

## Commands

```bash
# 왜 이 커맨드를 쓰는지 명확하지 않은 것만 여기 남긴다
npm run dev      # {특이한 점이 있으면 설명}
npm run build
npm run lint
npm run test
```

## Definition of Done

PR 올리기 전 아래를 모두 통과해야 한다.

- [ ] {기본 검증 커맨드} 통과
- [ ] UI 변경 시: {확인할 화면 크기/브라우저}에서 직접 확인
- [ ] API/DB 변경 시: {관련 테스트 또는 마이그레이션 기준} 확인
- [ ] {추가 기준}

## 커밋 메세지 규칙

Conventional Commits 형식을 따른다.

예시: `feat: 로그인 폼 유효성 검사 추가`
