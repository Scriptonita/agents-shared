# 03 · Commits e idiomas

**Cuándo leerlo:** al escribir un mensaje de commit, el título de una PR o al decidir en
qué idioma va un texto.

## Formato: Conventional Commits, en inglés

```
<type>(<scope>): <summary in imperative, lowercase, no final period>

<optional body: why, not what; wrap at ~72 columns>
```

| Tipo | Uso |
|---|---|
| `feat` | Funcionalidad nueva visible para el usuario o para los consumidores del paquete |
| `fix` | Corrección de un error |
| `chore` | Mantenimiento: dependencias, versiones, configuración, tooling |
| `docs` | Solo documentación |
| `refactor` | Cambio interno sin cambio de comportamiento |
| `test` | Solo tests |
| `security` | Endurecimiento o corrección de seguridad |

- `scope` opcional: el área tocada (`deps`, `auth`, `profile`, `i18n`, `dev`…).
- Resumen en imperativo: `add`, `fix`, `bump`, no `added`/`fixes`.
- Subidas de dependencia: `chore(deps): bump <paquete> to ^X.Y.Z`.
- Publicaciones: incluye la versión en el resumen (`feat: add session export (0.7.0)`).
- Un cambio que rompe compatibilidad lleva `!` (`feat!: …`) y un pie `BREAKING CHANGE:`.

Ejemplos:

```
feat(profile): show the shared avatar component
fix(auth): keep the session after a token refresh
chore(deps): bump the ui package to ^0.10.0
chore(dev): widen the Turbopack root when a package is linked
docs: document the release order for shared packages
```

## Idiomas

| Contenido | Idioma |
|---|---|
| Código, identificadores, comentarios de código | Inglés |
| Mensajes de commit, nombres de rama, títulos de PR | Inglés |
| Descripción de la PR, revisiones, documentación, planificación | Español |
| Textos de interfaz | Catálogos de i18n por idioma |

Para escribir en español, ver [00-writing-in-spanish.md](00-writing-in-spanish.md).
