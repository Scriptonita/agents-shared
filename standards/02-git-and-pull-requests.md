# 02 · Git y pull requests

**Cuándo leerlo:** antes de crear una rama, hacer un commit o abrir una PR.

## Flujo

1. Parte siempre de la rama principal actualizada:
   `git switch main && git pull --ff-only` (o `master`, según el repo).
2. Crea una rama por cambio: `git switch -c <tipo>/<descripcion-corta>`.
3. Commits pequeños y con sentido propio. Si un cambio puede querer revertirse por
   separado (un *workaround*, un cambio de config), va en su propio commit.
4. Antes de subir: tests, *typecheck*, *lint* y *build* en verde.
5. `git push -u origin <rama>` y abre la PR en GitHub (`gh pr create`).
6. El merge se hace en GitHub. **Nunca merge local a la rama principal.**
7. Tras el merge, borra la rama y vuelve a la principal actualizada.

## Nombres de rama

`<tipo>/<descripcion-en-kebab-case>`, en inglés, con los mismos tipos que los commits:
`feat/`, `fix/`, `chore/`, `docs/`, `refactor/`, `test/`.
Ejemplos: `feat/profile-avatar`, `chore/ui-0.10.0`, `fix/login-redirect`.

## La PR

- Título con el formato de un commit (ver [03-commits-and-languages.md](03-commits-and-languages.md)).
- Descripción en español: qué cambia, por qué, cómo se ha verificado y, si aplica,
  capturas o la historia/issue que cierra.
- Si depende de otra PR o de una publicación npm, dilo en la descripción y en qué orden
  deben mergearse.
- Una PR, un propósito. No mezcles refactors con funcionalidad.

## Nunca

- `git push --force` a la rama principal.
- Commitear `node_modules`, builds (`dist/`, `.next/`), `.env*` con valores reales o
  ficheros del sistema (`.DS_Store`).
- Reescribir historia ya publicada en ramas compartidas sin acordarlo.

## Repos con submódulos

- Clona con `--recurse-submodules`.
- Actualiza el submódulo de agentes al último commit remoto antes de trabajar:
  `git submodule update --init --recursive && git submodule update --remote agents`.
- Subir el puntero del submódulo es un commit propio (`chore: bump agents submodule`).
