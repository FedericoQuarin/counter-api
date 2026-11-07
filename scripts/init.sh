#!/usr/bin/env bash
# Chequeo rápido del entorno al empezar una sesión.
cd "$(dirname "$0")/.."
echo "== Java requerido (pom) =="; grep -m1 'java.version' pom.xml || true
echo "== Java instalado =="; java -version 2>&1 | head -1 || echo "Java no encontrado"
echo "== Git =="; git status -sb 2>/dev/null | head -5 || echo "No es un repo git"
echo "== Features pendientes =="
grep -c '"passes": false' docs/features.json || true
echo "== Último progreso =="
head -12 docs/progress.md
echo "== Hooks de git =="
if [ "$(git config core.hooksPath 2>/dev/null)" = ".githooks" ]; then echo "OK"; else echo "NO instalados: ejecutá bash scripts/install-hooks.sh"; fi
