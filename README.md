# OpenClaw Autonomy Stack

Kompletna infrastruktura za potpunu autonomiju AI agenta.

## 📋 Struktura

```
autonomy-stack/
├── scripts/           # Automatske skripte
│   ├── github_deploy.sh
│   ├── hf_models.sh
│   └── ...
├── config/            # Konfiguracija
│   ├── docker-compose.autonomy.yml
│   ├── prometheus.yml
│   └── multi-model-gateway.sh
├── mlops/             # MLOps automation
│   ├── train.py
│   └── mlflow.sh
├── meta-learning/     # Meta-učenje
│   ├── automated_skill_gen.sh
│   ├── performance_monitor.sh
│   └── autonomous_research.sh
├── models/            # Preuzeti modeli
└── .github/
    └── workflows/     # CI/CD pipeline
        ├── ci-cd.yml
        ├── mlops.yml
        └── model-management.yml
```

## 🚀 Pokretanje

```bash
# Svi servisi
docker-compose -f config/docker-compose.autonomy.yml up -d

# Samo MLOps
docker-compose -f config/docker-compose.autonomy.yml up -d mlflow

# Samo monitoring
docker-compose -f config/docker-compose.autonomy.yml up -d prometheus grafana
```

## 📊 Servisi

| Servis | Port | Opis |
|--------|------|------|
| OpenClaw MoE | 8080 | Model orchestration |
| Claude Agent | 8081 | AI agent |
| Ollama | 11434 | Local model serving |
| MLflow | 5000 | Model tracking |
| Prometheus | 9090 | Metrics |
| Grafana | 3001 | Dashboard |

## 🔧 Skripte

```bash
# GitHub deploy
./scripts/github_deploy.sh

# Model management
./scripts/hf_models.sh list
./scripts/hf_models.sh download "Qwen/Qwen2.5-72B-Instruct"

# MLOps
./mlops/mlflow.sh train
./mlops/mlflow.sh register <model-name>

# Multi-model gateway
./config/multi-model-gateway.sh

# Meta-learning
./meta-learning/automated_skill_gen.sh
./meta-learning/performance_monitor.sh
./meta-learning/autonomous_research.sh
```

## 📈 Metrike

- **Response Time**: < 200ms
- **Uptime**: 99.9%
- **Model Latency**: p95 < 500ms
- **Cost per Request**: < $0.01

## 🔐 Auth

```bash
# GitHub
gh auth login

# HuggingFace
hf auth login
```

## 🏗️ Development

```bash
# Local development
docker-compose -f config/docker-compose.autonomy.yml up

# Tests
python -m pytest tests/

# Build
docker build -t autonomy-stack .
```
