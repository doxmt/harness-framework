# harness_framework

Claude Code 프로젝트용 하네스 템플릿. 새 프로젝트 시작 시 플레이스홀더를 채워 사용한다.

## 작업 사이클

```
/plan → /start → /revise → /submit → /finish → /wrap
```

| 커맨드         | 설명                                           |
| -------------- | ---------------------------------------------- |
| `/plan`        | 인터뷰 기반 계획 수립                          |
| `/start`       | 이슈/브랜치 생성 후 TDD 구현                   |
| `/revise`      | 코드 리뷰 반영                                 |
| `/submit`      | 커밋, 푸시, PR 생성                            |
| `/finish`      | PR squash merge                                |
| `/wrap`        | 세션 마무리, 문서 갱신                         |
| `/audit`       | 보안 감사 + 코드 단순화                        |
| `/code-review` | Codex 코드 리뷰 → `docs/code-review.md`        |
| `/plan-review` | Codex adversarial 리뷰 → `docs/plan-review.md` |
| `/pr-review`   | Codex 브랜치 전체 리뷰 → `docs/pr-review.md`   |
| `/monitor`     | 에이전트 실행 로그 pane 표시                   |

## 참고

- 터미널 멀티플렉서: tmux 대신 **cmux**
- TDD 강제: 테스트 파일 없으면 구현 파일 수정 불가 (JS/TS·Python 파일 한정 — 다른 언어는 가드 미적용)
- `conductor`는 Agent Teams 전용 오케스트레이터
