# 00 · Escribir en español

**Cuándo leerlo:** siempre que vayas a escribir documentación, historias, informes,
comentarios de PR o cualquier texto en español.

## Qué va en español y qué en inglés

| Contenido | Idioma |
|---|---|
| Documentación de producto, planificación (PRD, épicas, historias), handoffs | Español |
| Comunicación con el equipo (respuestas, descripciones de PR, comentarios de revisión) | Español |
| Código, identificadores, nombres de ficheros de código | Inglés |
| Mensajes de commit y nombres de rama | Inglés (ver [03-commits-and-languages.md](03-commits-and-languages.md)) |
| Textos de interfaz | Los del catálogo de i18n de cada idioma, nunca en el código (ver [07-i18n.md](07-i18n.md)) |

## Ortografía y estilo

- **Tildes y eñes siempre**, también en títulos, tablas y listas: «sesión», «configuración»,
  «año». Una tilde que falta cambia el significado («esta»/«está», «el»/«él»).
- Signos de apertura en preguntas y exclamaciones: «¿…?», «¡…!».
- Comillas latinas «…» para citar textos o términos; las comillas rectas `"…"` solo dentro
  de código.
- Mayúsculas solo al inicio de frase y en nombres propios. Los títulos no van en
  «Title Case»: «Guía de instalación», no «Guía De Instalación».
- Fechas en formato ISO `AAAA-MM-DD` (`2026-10-06`). Nunca fechas relativas («ayer», «el
  jueves») en documentos que se van a releer.
- Números: separador decimal coma en prosa («1,5 s»); en código y valores técnicos, el
  formato del lenguaje (`1.5`).

## Términos técnicos

- Identificadores, comandos, rutas, nombres de paquete y claves de configuración van **en
  inglés y entre backticks**, sin traducir ni conjugar: «ejecuta `npm test`», «el hook
  `useGameStore`».
- Usa el término en español cuando existe y se entiende: «rama» (branch), «repositorio»,
  «despliegue», «prueba», «fichero», «enlace», «dependencia».
- Deja en inglés los términos sin traducción asentada: *commit*, *pull request* (PR),
  *merge*, *lockfile*, *hook*, *token*, *store*, *build*. No inventes calcos
  («comprometer» por *commit*).
- Un mismo concepto, un mismo término en todo el documento. Si el proyecto tiene un
  glosario o una terminología canónica, manda sobre esta guía.

## Redacción

- Frases cortas, voz activa, la conclusión primero.
- Instrucciones en imperativo de segunda persona: «Lee el índice», «Ejecuta el
  instalador».
- Tablas para comparar y listas para pasos; prosa para explicar el porqué.
- Rutas siempre relativas a la carpeta raíz del espacio de trabajo o al propio repo. Nunca
  rutas absolutas de una máquina concreta (`/Users/…`, `~/…`), salvo `~/.claude/` cuando se
  habla de la configuración de Claude Code.
