#!/usr/bin/env bash
# Multi-model orchestration gateway
set -euo pipefail

GATEWAY_PORT=8082
MODELS=(
  "minimax:11434"
  "qwen:11435"
  "llama:11436"
)

echo "=== Multi-Model Gateway ==="
echo "Port: $GATEWAY_PORT"
echo "Available models:"
for m in "${MODELS[@]}"; do
  echo "  - $m"
done
echo "
Routes:
  POST /v1/chat/completions -> /v1/chat/completions?model=minimax
  POST /v1/chat/completions -> /v1/chat/completions?model=qwen
  POST /v1/chat/completions -> /v1/chat/completions?model=llama
"
