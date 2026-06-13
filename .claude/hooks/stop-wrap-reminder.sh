#!/bin/bash
# 미커밋 변경 알림 — Stop은 매 턴 실행되므로 30분에 한 번만 알린다

PROJECT_ROOT="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
LOG_DIR="${PROJECT_ROOT}/.claude/logs"
STAMP="${LOG_DIR}/stop-reminder.stamp"
mkdir -p "$LOG_DIR"

# untracked 포함 전체 변경 감지
CHANGES=$(git -C "$PROJECT_ROOT" status --porcelain 2>/dev/null)
[ -z "$CHANGES" ] && exit 0

if [ -f "$STAMP" ]; then
  LAST=$(stat -f %m "$STAMP" 2>/dev/null || stat -c %Y "$STAMP" 2>/dev/null || echo 0)
  NOW=$(date +%s)
  [ $((NOW - LAST)) -lt 1800 ] && exit 0
fi

touch "$STAMP"
cmux notify --title "harness" --body "커밋되지 않은 변경사항이 있습니다. /wrap과 커밋 여부를 확인하세요." 2>/dev/null || true
