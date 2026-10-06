# 08 · Troubleshooting

**Cuándo leerlo:** cuando algo falla de forma rara en el stack (TypeScript, React,
Next.js, Vite, Tailwind, Supabase, npm). Cada entrada: síntoma → causa → solución.

## Animación

### SVG + framer-motion: el elemento salta o aparece en el origen

- **Causa:** framer-motion sobrescribe el atributo `transform` del elemento SVG al animar
  `scale`, `x` o `y`, y se pierde el `transform` manual de posición.
- **Solución:** separa posición y animación: un `<g>` estático con el `transform` de
  posición y, dentro, un `motion.g` que solo anima.

## Paquetes enlazados en local

### Turbopack aborta con «leaves the filesystem root»

- **Causa:** con un paquete enlazado por symlink, Tailwind o Turbopack siguen el enlace
  fuera de la carpeta del proyecto.
- **Solución:** arrancar con `next dev --webpack`, o ensanchar `turbopack.root` a la
  carpeta padre **solo cuando se detecta un symlink** en `node_modules/<scope>` (con un
  `lstat`, para que en CI y producción no cambie nada). Ese cambio va en su propio commit.

### Tailwind no genera las clases de un paquete compartido

- **Causa:** el paquete usa clases que la app no escanea.
- **Solución:** incluye `node_modules/<scope>/<paquete>/dist/**` en el `content` /
  `@source` de Tailwind de la app.

### Un estilo del paquete no aparece y no hay ningún error

- **Causa:** la app no define una CSS custom property que el paquete usa; la declaración
  se descarta en silencio.
- **Solución:** el paquete exporta su lista de tokens requeridos y la app la verifica en
  `prebuild` o en un test. Ver [07-i18n.md](07-i18n.md), que aplica el mismo patrón a las claves.

## Entorno local

### La app con un `.env.local` de ejemplo no conecta y la consola muestra un error de CSP

- **Causa:** la Content Security Policy solo permite el dominio del proveedor (p. ej.
  `connect-src https://*.supabase.co`) y el placeholder no lo cumple.
- **Solución:** usa placeholders con la forma real (`https://example.supabase.co`). La
  interfaz renderiza; lo que necesita datos reales sigue necesitando credenciales.

### El puerto de desarrollo está ocupado

- Arranca en otro puerto con `--port <n> --strictPort` (Vite) o `-p <n>` (Next.js) en vez
  de matar procesos que no son tuyos.

## npm

### `npm publish` devuelve E404 en un paquete con scope

- **Causa:** un `.npmrc` versionado en el repo con `_authToken=${NPM_TOKEN}` y la variable
  sin definir: tiene precedencia sobre el `.npmrc` del usuario y el publish va sin
  autenticar.
- **Solución:** elimina el `.npmrc` del repo y añádelo al `.gitignore`.

### `npm ci` falla en CI pero `npm install` funciona en local

- **Causa:** lockfile generado incrementalmente, con entradas sin `resolved`.
- **Solución:** `rm -rf node_modules && npm install` y commitea el lockfile. Ver
  [04-dependencies-and-lockfiles.md](04-dependencies-and-lockfiles.md).

## Lint

### `eslint .` reporta miles de problemas en ficheros que no has tocado

- **Causa:** el lint recorre builds (`.next/`, `dist/`).
- **Solución:** añádelos a `ignores` en la configuración de ESLint.
