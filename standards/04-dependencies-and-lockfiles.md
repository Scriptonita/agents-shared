# 04 · Dependencias y lockfiles

**Cuándo leerlo:** al añadir, quitar o subir una dependencia, o al probar en local un
paquete propio sin publicarlo.

## Cambiar dependencias

- Tras cambiar `package.json`, regenera el lockfile desde cero:
  ```bash
  rm -rf node_modules && npm install
  ```
  Un `npm install` incremental puede dejar entradas del lockfile sin el campo `resolved`
  completo y la CI (`npm ci`) falla.
- Commitea `package.json` y `package-lock.json` juntos, en el mismo commit.
- Un solo gestor de paquetes por repo (si hay `package-lock.json`, npm).
- Las dependencias que el consumidor debe compartir (React y similares) van en
  `peerDependencies` de la librería. Ver [01.1](01.1-golden-rules-npm-libraries.md).

## Paquetes propios en desarrollo cruzado

Para probar un cambio de una librería en una app sin publicarla:

- **`npm link` o symlink manual** de `node_modules/<scope>/<paquete>` al repo hermano, con
  la librería en modo *watch* (`tsup --watch` o equivalente).
  - Usa rutas **relativas** en el symlink: así sobrevive a mover o renombrar la carpeta
    raíz.
  - Guarda la copia npm original al lado si vas a necesitar volver a ella.
  - El enlace no viaja entre máquinas: hay que rehacerlo (o `npm ci`).
- **`file:` links** en `package.json`: solo temporales y nunca en una PR mergeada.
- Antes de abrir la PR de la app: deshaz el enlace, publica la librería y sube el rango
  desde el registro.

Problemas habituales con paquetes enlazados (Turbopack, Tailwind, dedupe de React): ver
[08-troubleshooting.md](08-troubleshooting.md).

## Publicar

- Orden: merge de la PR de la librería → `npm publish` → PR de subida en cada consumidor.
- Nunca un `.npmrc` versionado con `_authToken`: tiene precedencia sobre el del usuario y,
  si la variable no está definida, el *publish* falla con un E404 engañoso.
