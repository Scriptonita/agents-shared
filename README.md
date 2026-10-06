# agents-shared

Estándares y skills de Claude Code reutilizables entre proyectos. Se monta como
submódulo git en `agents/` de cada repo (de documentación y de código). No contiene
código de producto ni nada específico de un proyecto.

```
agents-shared/
├── ARCHITECTURE-INDEX.md   ← punto de entrada: qué leer para cada tarea
├── standards/              estándares atómicos numerados (00 español, 01 reglas de oro, 02..NN temáticos)
├── skills/                 skills de Claude Code compartidas + install.sh
├── proposals/              RFCs para cambios transversales
└── knowledge-base.md       trucos, herramientas y recursos descubiertos
```

## Añadirlo a un repo

```bash
git submodule add -b main https://github.com/Scriptonita/agents-shared.git agents
git add .gitmodules agents
git commit -m "chore: add agents-shared as the agents submodule"
```

Quien clone el repo después: `git clone --recurse-submodules <url>` o, si ya lo tenía,
`git submodule update --init --recursive`.

## Actualizarlo

```bash
git submodule update --remote agents
git add agents && git commit -m "chore: bump agents submodule"
```

## Instalar las skills

```bash
agents/skills/install.sh
```

Crea symlinks en `~/.claude/skills/` hacia `agents/skills/*` del repo desde el que lo
ejecutes, así que actualizar el submódulo actualiza las skills. Los symlinks usan rutas
absolutas: si mueves o renombras la carpeta que contiene el repo, vuelve a ejecutarlo.
Detalle en [skills/README.md](skills/README.md).

## Bloque para el `CLAUDE.md` de cada repo

Copia esto al principio del `CLAUDE.md` del repo consumidor:

````markdown
## PASO 0 (bloqueante): actualizar `agents/`

Antes de cualquier tarea, inicializa el submódulo de agentes y llévalo al último
commit remoto:

```bash
git submodule update --init --recursive
git submodule update --remote agents
```

Si falla, para y avisa: no trabajes con estándares desactualizados.

## Instrucciones de agentes

- Lee SIEMPRE `agents/ARCHITECTURE-INDEX.md` primero.
- Lee SIEMPRE las reglas de oro comunes (`agents/standards/01-golden-rules.md`) y
  las de tu lado (`01.x-golden-rules-*.md`) según el índice.
- Lee `agents/standards/00-writing-in-spanish.md` si vas a escribir en español.
- Lee SOLO lo que el índice indique para tu tarea. NUNCA leas todo `agents/`.
````

## Contribuir

- Un estándar = un tema, en su propio fichero numerado. Cabecera con «Cuándo leerlo».
- Todo lo que entre aquí es genérico: si menciona un producto concreto, va en la
  documentación de ese producto.
- Los cambios que afectan a varios proyectos se proponen en [proposals/](proposals/README.md).
- Al añadir un estándar, añádelo a la tabla de [ARCHITECTURE-INDEX.md](ARCHITECTURE-INDEX.md).
