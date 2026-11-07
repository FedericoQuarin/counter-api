#!/usr/bin/env bash
# Formateo post-edición. No-op hasta configurar Spotless en el pom.xml.
cd "$(dirname "$0")/.."
if [ -f mvnw ] && grep -q "spotless" pom.xml 2>/dev/null; then
  ./mvnw -q -B spotless:apply >/dev/null 2>&1 || true
fi
exit 0
