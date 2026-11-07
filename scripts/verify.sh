#!/usr/bin/env bash
# Único punto de verificación: build + tests. Cambia por lenguaje.
set -euo pipefail
cd "$(dirname "$0")/.."
./mvnw -q -B verify
echo "VERIFY OK"
