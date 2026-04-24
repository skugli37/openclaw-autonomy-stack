#!/usr/bin/env bash
# Faza 2: Auto-deploy skripte za GitHub
# github_auto_deploy.sh
set -euo pipefail

REPO_NAME="openclaw-autonomy-stack"
BRANCH="main"

# Provera github CLI
echo "=== GitHub CLI Status ==="
gh auth status

# Kreiranje repozitorijuma ako ne postoji
if ! gh repo view skugli37/$REPO_NAME &>/dev/null; then
    echo "Kreiram GitHub repo: skugli37/$REPO_NAME"
    gh repo create skugli37/$REPO_NAME \
        --public \
        --description="OpenClaw Autonomy Stack - Core Infrastructure" \
        --confirm
else
    echo "Repo već postoji"
fi

# Push fajlova na repo
echo "=== Deploy na GitHub ==="
cd /home/kugli/.openclaw/workspace/autonomy-stack
git init
git remote add origin https://github.com/skugli37/$REPO_NAME.git
git add .
git commit -m "Initial deployment: full autonomy stack" --allow-empty
git branch -M main
git push -u origin main

echo "Deploy uspešan!"
echo "Repo: https://github.com/skugli37/$REPO_NAME"
