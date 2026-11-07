# Reutilizar este harness en otro lenguaje o con otro agente

## Capas
- **Agnóstico de modelo** (no tocar): `AGENTS.md`, `docs/` (spec, features, progress, playbooks), `scripts/`.
- **Adaptador Claude Code** (`.claude/`): `settings.json` (permisos y hooks, no existe equivalente estándar) y la definición del agente revisor, que apunta al playbook.
- Claude Code lee `AGENTS.md` directo (v2.1.277 o posterior) porque no hay `CLAUDE.md`. Si en tu versión no lo toma, crear `CLAUDE.md` con una sola línea: `@AGENTS.md`.
- Otros agentes (Codex, Cursor, Copilot, Gemini CLI) leen `AGENTS.md` directamente; sus permisos y hooks se configuran en su propio formato.
- Si más adelante se agregan skills: el estándar abierto es `.agents/skills/`; Claude Code, hasta donde se pudo confirmar, carga `.claude/skills/`.

## Para cambiar de lenguaje
0. Calidad: reemplazar `config/` y los plugins del `pom.xml` por los linters del nuevo lenguaje; el hook `.githooks/pre-commit` no cambia (solo llama a `scripts/verify.sh`).
1. `scripts/verify.sh`, `scripts/init.sh`, `scripts/format.sh`: build, tests, lint y formateo del nuevo lenguaje.
2. En `AGENTS.md`: secciones "Stack", "Comandos" y "Convenciones".
3. En `.claude/settings.json`: reemplazar `mvn`/`mvnw` por npm, pip, go, etc.
4. En `docs/playbooks/`: ajustar los pasos específicos del framework.
