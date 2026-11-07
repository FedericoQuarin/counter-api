# Progreso

## Estado actual
Esqueleto Spring Boot 4.1.2 (Java 25, Maven wrapper) incorporado y renombrado a Counter. Se sumaron Checkstyle, PMD y SpotBugs al build y un hook pre-commit. `scripts/verify.sh` pasa en local. Repo en GitHub (`FedericoQuarin/counter-api`): `main` protegida por ruleset (solo PR, sin force push ni borrado) y CI en GitHub Actions (`.github/workflows/ci.yml`, job `verify`) que corre `scripts/verify.sh` y es check obligatorio para mergear.

## Próximo paso
1. Completar `docs/spec.md`.
2. Primera feature: F001 (en una rama + PR, ya no se puede pushear directo a `main`).

## Bitácora
- 2026-11-07: commit inicial, push a GitHub, rama renombrada a `main`, ruleset de protección y workflow de CI. Se marcaron `mvnw` y los scripts como ejecutables en git para que corran en el runner Linux.
