# 프레임워크 셋업

## 새 프로젝트 적용 순서

1. 이 하네스 파일들을 새 프로젝트 루트에 복사한다.
2. `develop` 브랜치를 만들고 푸시한다 — 작업 사이클(`/start`, `/submit`, `/finish`)이 develop 기점으로 동작한다.

   ```bash
   git checkout -b develop && git push -u origin develop
   ```

3. 플랜모드로 프로젝트 목표, 사용자, 핵심 기능, 기술 스택, 디자인 방향을 정리한다.
4. 확정된 계획을 바탕으로 `CLAUDE.md`, `docs/prd.md`, `docs/architecture.md`, `docs/adr.md`, `DESIGN.md`의 플레이스홀더를 채운다.
5. `docs/current_state.md`에 첫 작업 후보를 적고 `/start`로 작업 사이클을 시작한다.
6. 작업이 끝나면 `/wrap`으로 `docs/work_log.md`와 `docs/current_state.md`를 갱신한다.

## CI/CD 템플릿 적용 (선택)

GitHub Actions + Vercel 배포가 필요하면 `docs/templates/`의 템플릿을 복사한다.

- `preview-cicd.template.yml` → `.github/workflows/preview-cicd.yml` — develop 대상 PR에 Preview 배포
- `production-cicd.template.yml` → `.github/workflows/production-cicd.yml` — main push 시 Production 배포

각 파일 상단 주석의 사용 방법(브랜치 수정, Secrets 등록)을 따른다.

## Codex 플러그인 설치

코드 리뷰(`/code-review`, `/plan-review`, `/pr-review`)를 사용하려면 Codex 플러그인이 필요하다.

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
