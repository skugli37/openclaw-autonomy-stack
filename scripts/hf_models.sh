#!/usr/bin/env bash
# HuggingFace model management
set -euo pipefail

MODELS=(
    "Qwen/Qwen2.5-72B-Instruct"
    "meta-llama/Llama-3.3-70B-Instruct"
    "mistralai/Mistral-Small-24B-Instruct-2506"
    "google/gemma-3-27b-it"
)

case "${1:-list}" in
    list)
        echo "=== Available models ==="
        for m in "${MODELS[@]}"; do
            echo "- $m"
        done
        ;;
    download)
        local model="${2:?Specify model}"
        echo "Downloading $model..."
        huggingface-cli download "$model" --local-dir "./models/${model##*/}"
        echo "Done"
        ;;
    *)
        echo "Usage: $0 {list|download <model>}"
        ;;
esac
