#!/usr/bin/env bash
# Agent Result Hook — PostToolUse[Agent]
# 에이전트가 완료될 때 cmux 알림 + 로그 기록

set -u

PROJECT_ROOT="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
LOG_DIR="${PROJECT_ROOT}/.claude/logs"
LOG_FILE="${LOG_DIR}/agents.log"
mkdir -p "$LOG_DIR"

AGENT_INFO=$(python3 -c '
import json, sys

try:
    payload = json.load(sys.stdin)
except Exception:
    sys.exit(0)

tool_input = payload.get("tool_input") or {}
subagent_type = tool_input.get("subagent_type") or ""

resp = payload.get("tool_response") or payload.get("tool_result") or ""
if isinstance(resp, dict):
    resp = resp.get("content") or resp.get("text") or ""
if isinstance(resp, list):
    parts = [b.get("text", "") for b in resp if isinstance(b, dict)]
    resp = " ".join(parts)
if not isinstance(resp, str):
    resp = str(resp)

summary = resp.strip()[:120].replace("\n", " ")
if subagent_type:
    print(f"{subagent_type}|{summary}")
')

if [ -z "$AGENT_INFO" ]; then
  exit 0
fi

AGENT_NAME="${AGENT_INFO%%|*}"
AGENT_SUMMARY="${AGENT_INFO#*|}"

TIMESTAMP=$(date "+%H:%M:%S")

if [ -n "$AGENT_SUMMARY" ]; then
  echo "[${TIMESTAMP}] ✅ ${AGENT_NAME} — ${AGENT_SUMMARY}" >> "$LOG_FILE"
  cmux notify --title "✅ ${AGENT_NAME} 완료" --body "${AGENT_SUMMARY}" 2>/dev/null || true
else
  echo "[${TIMESTAMP}] ✅ ${AGENT_NAME} 완료" >> "$LOG_FILE"
  cmux notify --title "✅ ${AGENT_NAME} 완료" --body "" 2>/dev/null || true
fi

exit 0
