# Counter API

API REST en Java con Spring Boot. Este archivo es corto a propósito: el detalle vive en `docs/`. Aplica a cualquier agente de código.

## Stack
- Java 25, Spring Boot 4.1.2, Maven. Usar siempre el wrapper (`./mvnw`).
- Dependencias actuales: `webmvc`, Lombok, H2 (runtime) con su consola, y `webmvc-test` para tests.
- Paquete base: `com.example.counter`.
- El esqueleto del proyecto ya existe (generado con Spring Initializr); crearlo no forma parte del flujo.
- El `pom.xml` todavía NO incluye validación ni persistencia (JPA). Si una feature las necesita, sumá el starter correspondiente y anotalo en `docs/progress.md`.

## Empezar cada sesión
1. Leé `docs/progress.md` y `docs/features.json`.
2. Corré `bash scripts/init.sh` para chequear el entorno.
3. Tomá UNA feature con `"passes": false` (la de mayor prioridad), implementala, verificala y cerrala siguiendo "Cerrar una feature".
4. Trabajala en su propia rama creada desde `main` actualizado: `git switch main && git pull && git switch -c feature/<id>-<slug>` (ej.: `feature/F001-health`).

## Cerrar una feature (en este orden)
`main` está protegida en GitHub: no acepta push directo ni force push, y solo se mergea por PR con el check `verify` del CI en verde (`.github/workflows/ci.yml`, corre `scripts/verify.sh`).
1. **Preparar la rama:** con `bash scripts/verify.sh` en verde, marcá la feature `"passes": true`, actualizá `docs/progress.md` (qué hiciste, qué sigue, problemas abiertos) y hacé un commit chico con mensaje claro.
2. **Crear PR:** `git push -u origin <rama>` y `gh pr create --base main`.
3. **Esperar a que pase el CI:** `gh pr checks <número> --watch`. Si falla, corregí en la misma rama, pusheá y volvé a esperar. Nunca intentes saltear la protección.
4. **Mergear PR:** `gh pr merge <número> --squash --delete-branch`.
5. **Finalizar tarea:** `git switch main && git pull`. La feature recién está cerrada cuando su PR está mergeado en `main`.

## Reglas
- Una feature por sesión. No empieces otra hasta cerrar la actual (paso 5 de "Cerrar una feature").
- Una feature solo pasa a `"passes": true` si `bash scripts/verify.sh` termina bien. No la marques por inspección visual.
- No cambies `docs/spec.md` sin avisar; si la spec es ambigua, preguntá.
- No leas ni escribas `.env` ni `secrets/`.

## Calidad (obligatoria antes de commitear)
- Checkstyle, PMD y SpotBugs forman parte del build de Maven y corren con `bash scripts/verify.sh`. Cualquier violación rompe el build.
- Un hook de git (`.githooks/pre-commit`) ejecuta `verify.sh` en cada commit y lo rechaza si falla. Activarlo una vez por clon: `bash scripts/install-hooks.sh`.
- Nunca uses `--no-verify` ni saltees el hook.
- Si un chequeo falla, corregí el código. No debilites reglas, no agregues exclusiones y no suprimas avisos (`@SuppressWarnings`, `//NOPMD`, filtros) sin avisar y justificarlo en `docs/progress.md`.
- Configuración: `config/checkstyle/`, `config/pmd/`, `config/spotbugs/`; versiones en las propiedades `qa.*` del `pom.xml`.

## Comandos (única sección que cambia por lenguaje)
- Verificar (build + tests): `bash scripts/verify.sh`
- Chequear entorno: `bash scripts/init.sh`
- Formatear: `bash scripts/format.sh`
- Correr la app: `./mvnw spring-boot:run`

## Convenciones Java / Spring Boot
- Paquetes por capa dentro de `com.example.counter`: `controller`, `service`, `repository`, `model`/`dto`, `exception`.
- Controllers delgados: sin lógica de negocio. DTOs para entrada/salida, no exponer entidades.
- Errores centralizados en un `@RestControllerAdvice`.
- Tests: JUnit 5 + MockMvc para controllers; un test por comportamiento, no por método.
- Spring Boot 4 reorganizó módulos y paquetes respecto de 3.x: ante la duda con imports o starters, consultá la documentación de 4.1 en lugar de asumir.

## Procedimientos (playbooks)
- Revisar cambios antes de cerrar una feature: `docs/playbooks/review.md`

## Ver también
- `docs/spec.md` (qué hace la API) · `docs/PORTING.md` (cómo reutilizar este harness en otro lenguaje)
