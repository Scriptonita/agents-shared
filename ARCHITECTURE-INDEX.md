# ARCHITECTURE-INDEX — punto de entrada

Lee este fichero **primero**. Te dice qué estándares leer para tu tarea. **Lee solo
esos**; nunca leas todo `agents/`.

## Siempre

| Lee | Cuándo |
|---|---|
| [standards/01-golden-rules.md](standards/01-golden-rules.md) | En cualquier tarea |
| Las reglas de oro de tu lado (tabla siguiente) | En cualquier tarea en un repo de código |
| [standards/00-writing-in-spanish.md](standards/00-writing-in-spanish.md) | Si vas a escribir cualquier texto en español |

## Reglas de oro por lado

| Tipo de repo | Lee |
|---|---|
| Librería TypeScript publicada en npm (dominio, UI compartida, utilidades) | [standards/01.1-golden-rules-npm-libraries.md](standards/01.1-golden-rules-npm-libraries.md) |
| App front (Next.js, Vite SPA…) | [standards/01.2-golden-rules-frontend-apps.md](standards/01.2-golden-rules-frontend-apps.md) |
| Repo de documentación o especificación | Solo las comunes |

## Enrutamiento por tarea

| Tarea | Estándares |
|---|---|
| Crear rama, commitear, abrir o revisar una PR | [02-git-and-pull-requests.md](standards/02-git-and-pull-requests.md), [03-commits-and-languages.md](standards/03-commits-and-languages.md) |
| Añadir, quitar o subir dependencias; publicar un paquete; enlazar un paquete en local | [04-dependencies-and-lockfiles.md](standards/04-dependencies-and-lockfiles.md) |
| Diseñar, implementar o revisar UI (componentes, estilos, motion, accesibilidad, textos de UI) | [05-ui-design.md](standards/05-ui-design.md) (§14 y la sección temática que toque) |
| Escribir o cambiar lógica, preparar la verificación de una PR | [06-testing.md](standards/06-testing.md) |
| Añadir o cambiar textos visibles, añadir un idioma, componente compartido con textos | [07-i18n.md](standards/07-i18n.md) |
| Algo falla de forma rara (build, dev server, animaciones, npm, lint) | [08-troubleshooting.md](standards/08-troubleshooting.md) |
| Escribir documentación, historias o informes | [00-writing-in-spanish.md](standards/00-writing-in-spanish.md) |
| Proponer un cambio a estos estándares | [proposals/README.md](proposals/README.md) |

## Skills

Las skills compartidas están en [skills/](skills/README.md) y se instalan con
`skills/install.sh`. Claude Code las carga por su descripción; no hace falta leerlas a
mano.

## Lo específico de cada proyecto

Estos estándares son genéricos. Las reglas propias de un producto (dominio, nombres
canónicos, orden de publicación entre sus repos, plataformas) están en su repo de
documentación, que enlaza su `CLAUDE.md`. Si chocan, manda la regla del proyecto y se
abre una propuesta aquí si debería generalizarse.
