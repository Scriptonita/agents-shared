# Skills compartidas

Skills de Claude Code reutilizables entre proyectos. Cada carpeta con un `SKILL.md` es una
skill.

| Skill | Para qué |
|---|---|
| [`supabase`](supabase/SKILL.md) | Auth SSR en Next.js, funciones Postgres, esquema declarativo y Realtime |

## Instalación

```bash
agents/skills/install.sh
```

Desde cualquier repo que tenga este repo montado en `agents/` (o desde un clon de
trabajo: `skills/install.sh`). El script:

- crea un **symlink** por skill en `~/.claude/skills/<skill>`, así que un
  `git submodule update --remote agents` (o un `git pull` en el clon) las actualiza sin
  reinstalar;
- es idempotente: si el symlink ya apunta aquí, no hace nada;
- convierte en symlink una copia antigua de la misma skill (la guarda antes como
  `<skill>.bak-<fecha>`);
- re-enlaza un symlink roto o que apunta a otro clon de este repo;
- **avisa y no toca** un symlink que apunta a otro sitio, ni una carpeta que no pueda
  confirmar como copia de esta skill (pasa `--force` para sustituirlos igualmente; las
  carpetas se respaldan antes).

Reinicia Claude Code después de instalar para que cargue las skills.

## Skills de terceros recomendadas

No se copian aquí: se instalan desde su fuente oficial, que es quien las mantiene.

| Skill | Para qué | Fuente |
|---|---|---|
| `vercel-react-best-practices` | Rendimiento y patrones de React / Next.js | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `vercel-composition-patterns` | Composición de componentes React | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `shadcn` | Componentes shadcn/ui | [shadcn-ui/ui](https://github.com/shadcn-ui/ui) |
| `tailwind-design-system` | Design systems con Tailwind | [skills.sh](https://skills.sh) |
| `i18n-localization` | Internacionalización | [skills.sh](https://skills.sh) |
| `atomic-design-fundamentals` | Atomic design | [skills.sh](https://skills.sh) |
| `pencil-design` | Diseño con el MCP de Pencil | [skills.sh](https://skills.sh) |

Instálalas con `npx skills add <fuente>` (o el método que indique cada fuente) y elige
Claude Code como destino.

## Añadir una skill aquí

1. Crea `skills/<nombre>/SKILL.md` con frontmatter `name` y `description` (en inglés: la
   descripción es lo que Claude usa para decidir cuándo cargarla).
2. Material largo en `skills/<nombre>/references/`, enlazado desde `SKILL.md` para que se
   cargue solo cuando haga falta.
3. Nada específico de un proyecto: eso va en la documentación del proyecto.
4. Añádela a la tabla de arriba y ejecuta `install.sh`.
