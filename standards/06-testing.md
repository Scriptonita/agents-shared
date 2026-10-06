# 06 · Testing

**Cuándo leerlo:** al escribir o modificar lógica, al preparar una PR o al decidir cómo
verificar un cambio.

## Herramientas por defecto

- **Vitest** para unitarios e integración (`npm test` = `vitest run`, `test:watch` en
  local, `test:coverage` cuando haga falta medir).
- **Testing Library** para componentes React: se prueba lo que ve y hace el usuario
  (roles, textos, interacciones), no detalles de implementación.
- Tests en `__tests__/` o junto al fichero (`*.test.ts[x]`), según la convención que ya
  tenga el repo. No mezcles las dos.

## Qué se exige

| Tipo de repo | Mínimo |
|---|---|
| Librería de dominio | Tests para toda regla nueva o modificada, incluidos los casos límite. `prepublishOnly` ejecuta los tests |
| Librería de UI | Tests de los componentes y hooks que cambian; los exports públicos tienen al menos un test de render |
| App | Tests de la lógica propia (hooks, utilidades, *handlers*). Lo visual se verifica además en navegador |

- Un *bug* corregido lleva un test que falla sin el arreglo.
- Antes de un refactor grande en código sin tests, primero una **red de seguridad**: tests
  que fijen el comportamiento actual.
- Los tests no dependen de red ni de servicios reales (Supabase, APIs): se mockea el
  cliente o se usa un entorno local.

## Verificación antes de la PR

1. `npm test` en verde.
2. `typecheck` (`tsc --noEmit` o `tsc -b`) y `lint` limpios en lo que has tocado.
3. `npm run build` (incluye los `prebuild` que validan contratos de i18n y tokens).
4. Cambios visuales: comprobación en navegador, escritorio y móvil.

Si algo ya fallaba antes de tu cambio, compruébalo contra `HEAD` y dilo en la PR, con el
recuento exacto. No lo arregles de paso en la misma PR salvo que sea trivial.

## Tests que dependen de repos hermanos

Si un test resuelve un paquete propio por alias a la fuente del repo hermano, ese repo
tiene que estar clonado en la carpeta raíz. Si no lo está, el fallo es de entorno, no del
cambio: anótalo y no lo «arregles» tocando el alias.
