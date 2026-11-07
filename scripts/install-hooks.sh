#!/usr/bin/env bash
# Activa los hooks versionados en .githooks (se hace una vez por clon del repo).
cd "$(dirname "$0")/.."
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit 2>/dev/null || true
echo "Hooks instalados (core.hooksPath=.githooks)"
