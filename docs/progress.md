# Progreso

## Estado actual
Esqueleto Spring Boot 4.1.2 (Java 25, Maven wrapper) incorporado y renombrado a Counter. Se sumaron Checkstyle, PMD y SpotBugs al build y un hook pre-commit. Todavía no se corrió `scripts/verify.sh` (las versiones de los plugins no se pudieron probar al configurarlas).

## Próximo paso
1. Completar `docs/spec.md`.
2. Correr `bash scripts/install-hooks.sh` y `bash scripts/verify.sh` para confirmar que el esqueleto compila, el test de contexto pasa y los tres chequeos de calidad aceptan el código. Si algún plugin falla por versión, ajustar las propiedades `qa.*` del `pom.xml`.
3. Primera feature: F001.

## Bitácora
- (vacía)
