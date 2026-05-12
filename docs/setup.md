# 프레임워크 셋업

## 새 프로젝트 적용 순서

1. 이 하네스 파일들을 새 프로젝트 루트에 복사한다.
2. 플랜모드로 프로젝트 목표, 사용자, 핵심 기능, 기술 스택, 디자인 방향을 정리한다.
3. 확정된 계획을 바탕으로 `CLAUDE.md`, `docs/prd.md`, `docs/architecture.md`, `docs/adr.md`, `DESIGN.md`의 플레이스홀더를 채운다.
4. `docs/current_state.md`에 첫 작업 후보를 적고 `/start`로 작업 사이클을 시작한다.
5. 작업이 끝나면 `/wrap`으로 `docs/work_log.md`와 `docs/current_state.md`를 갱신한다.

## Codex 플러그인 설치

코드 리뷰(`/review`)를 사용하려면 Codex 플러그인이 필요하다.

```
/plugin marketplace add openai/codex-plugin-cc
/plugin install codex@openai-codex
/reload-plugins
/codex:setup
```

로그인이 안 됐으면:

```
! codex login
```

ChatGPT 계정 또는 OpenAI API 키로 인증한다.
