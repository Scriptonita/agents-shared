# Knowledge base

Trucos, herramientas y recursos descubiertos trabajando con agentes. Entradas cortas,
con fecha. Lo que se convierte en regla pasa a `standards/`.

## Herramientas

- **`gh` (GitHub CLI)** — crear PRs (`gh pr create`), renombrar repos
  (`gh repo rename`, conserva historial y redirige la URL antigua) y consultar
  visibilidad (`gh repo view --json visibility`). Sin `gh`, las PRs se quedan sin abrir
  al final de una sesión. (2026-10-06)
- **`uv run`** — ejecuta scripts Python sin preparar un entorno; lo usan los scripts de
  verificación de BMAD. (2026-10-06)

## BMAD

- BMAD se instala una vez en la carpeta raíz que contiene todos los repos, nunca dentro
  de un repo. `output_folder` apunta al repo de documentación y `project_knowledge` se
  corrige en `_bmad/custom/config.toml`, que el instalador no sobrescribe. (2026-10-06)
- Los artefactos que usan `{project-root}` (p. ej. `story_location` en
  `sprint-status.yaml`) se resuelven contra la carpeta raíz: incluyen el nombre del repo
  de documentación. (2026-10-06)

## Claude Code

- Al migrar un espacio de trabajo a otra estructura de carpetas (o de máquina), lo que
  no viaja con git hay que inventariarlo antes de borrar nada: memorias de todas las
  claves de proyecto en `~/.claude/projects/`, skills locales (`~/.claude/skills/`,
  `~/.agents/skills/`, `.claude/skills/` y `.agents/skills/` de cada repo),
  `settings.local.json`, personalizaciones de BMAD y trabajo sin subir. Cada cosa va a
  la documentación del proyecto, a este repo o se descarta. (2026-10-06)
- Las memorias se indexan por la ruta absoluta del proyecto: al mover o renombrar la
  carpeta donde se abre Claude Code hay que copiarlas a la clave nueva en
  `~/.claude/projects/`. (2026-10-06)
- Las skills enlazadas con symlink en `~/.claude/skills/` se actualizan con un
  `git pull`; hay que reiniciar Claude Code para que cargue skills nuevas. (2026-10-06)

## Verificación visual

- Un arnés CDP mínimo (Chrome headless + el WebSocket nativo de Node 22) permite capturas,
  consola y control de animaciones sin Playwright. Si vive en un scratchpad de sesión, se
  pierde: guárdalo en un repo si se va a reutilizar. (2026-08-26)
