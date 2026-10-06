# 05 · Diseño de UI

**Cuándo leerlo:** al diseñar, implementar o revisar cualquier interfaz (componentes,
pantallas, estilos, animaciones, textos de UI). Para una tarea concreta suele bastar la
sección [14. Reglas para Claude](#14-reglas-para-claude) más la sección temática que toque.

Este estándar es la fuente canónica de la guía de diseño. Las decisiones propias de cada
producto (paleta, tipografías, tokens concretos) viven en la documentación de ese producto.

## Mejores prácticas de diseño de aplicaciones
*Extraídas de los principales design systems del mundo.*
> Basado en: IBM Carbon · Google Material · Shopify Polaris · Atlassian · Microsoft Fluent · GitHub Primer · Adobe Spectrum · Salesforce Lightning · GOV.UK · y más de 100 sistemas adicionales.

---

## Índice

1. [Fundamentos: Qué es un Design System](#1-fundamentos)
2. [Design Tokens](#2-design-tokens)
3. [Color](#3-color)
4. [Tipografía](#4-tipografía)
5. [Espaciado y Layout](#5-espaciado-y-layout)
6. [Componentes](#6-componentes)
7. [Accesibilidad](#7-accesibilidad)
8. [Movimiento y Animación](#8-movimiento-y-animación)
9. [Contenido y Voz](#9-contenido-y-voz)
10. [Responsive y Multiplataforma](#10-responsive-y-multiplataforma)
11. [Dark Mode y Temas](#11-dark-mode-y-temas)
12. [Iconografía](#12-iconografía)
13. [Patrones de Interacción](#13-patrones-de-interacción)
14. [Reglas para Claude: Cómo aplicar estas prácticas](#14-reglas-para-claude)

---

## 1. Fundamentos

Un design system no es solo una biblioteca de componentes. Es un **lenguaje compartido** entre diseño, desarrollo y marca que define cómo un producto se ve, se siente y se comporta en todas sus plataformas.

### Capas de un design system completo

```
Tokens → Componentes → Patrones → Plantillas → Producto
```

- **Tokens**: Variables atómicas (colores, espaciados, tipografías, sombras).
- **Componentes**: Piezas reutilizables de UI (botones, inputs, modales).
- **Patrones**: Composiciones de componentes para flujos comunes (formularios, tablas de datos, onboarding).
- **Plantillas**: Estructuras de página completas.
- **Producto**: La aplicación final.

### Principios rectores (extraídos de Polaris/Carbon/Material)

- **Consistencia**: Una misma acción debe verse y comportarse igual en toda la app.
- **Eficiencia**: El sistema debe ayudar a los usuarios a completar tareas con el menor esfuerzo posible.
- **Accesibilidad**: Diseñar para todos, incluyendo personas con discapacidades, es responsabilidad, no opción.
- **Escalabilidad**: Las decisiones de hoy deben sostenerse a medida que el producto crece.
- **Claridad**: Cada elemento debe comunicar su propósito con precisión.

---

## 2. Design Tokens

Los tokens son la columna vertebral del sistema. Son variables con nombre que almacenan decisiones visuales en un formato agnóstico a la plataforma.

### Jerarquía de tokens (tres capas)

**Capa 1 — Tokens primitivos** (valores crudos):
```json
{
  "color-blue-500": "#0066FF",
  "space-4": "16px",
  "font-size-base": "16px"
}
```

**Capa 2 — Tokens semánticos** (propósito/rol):
```json
{
  "color-action-primary": "{color-blue-500}",
  "space-component-padding": "{space-4}",
  "font-size-body": "{font-size-base}"
}
```

**Capa 3 — Tokens de componente** (uso específico):
```json
{
  "button-background-color": "{color-action-primary}",
  "button-padding-horizontal": "{space-component-padding}"
}
```

### Convenciones de nomenclatura

Formato recomendado: `[categoría]-[propiedad]-[variante]-[estado]`

| Categoría | Ejemplos |
|-----------|---------|
| Color | `color-text-primary`, `color-bg-surface`, `color-border-subtle` |
| Spacing | `space-xs`, `space-md`, `space-xl` |
| Typography | `font-size-body-lg`, `font-weight-semibold` |
| Border | `border-radius-sm`, `border-width-default` |
| Shadow | `shadow-sm`, `shadow-elevated` |
| Motion | `duration-fast`, `easing-standard` |

### Reglas clave

- **Nunca usar valores crudos directamente en componentes**. Siempre referenciar tokens semánticos.
- Los tokens primitivos solo los usan los tokens semánticos, nunca la UI directamente.
- Definir tokens en CSS Custom Properties para la web:
  ```css
  :root {
    --color-action-primary: #0066FF;
    --space-md: 16px;
    --font-size-body: 1rem;
  }
  ```
- Los tokens deben soportar theming: dark mode, múltiples marcas o temas de alto contraste se consiguen redefiniendo tokens semánticos, no primitivos.

---

## 3. Color

### Sistema de paletas

Toda aplicación debe definir al menos:

- **Color de marca / acción primaria**: Para CTAs, links y elementos interactivos.
- **Color secundario/accent**: Para destacar elementos secundarios.
- **Colores neutros**: Escala de grises para texto, fondos y bordes.
- **Colores semánticos**: Success (verde), Warning (amarillo/naranja), Error (rojo), Info (azul).

### Escalas de color

Usar escalas de 10 pasos (100–1000) o de 50 en 50 (50–950):
```
brand-50  (más claro) → fondos de hover, chips suaves
brand-100            → fondos de elementos destacados
brand-500            → color base del brand
brand-700            → hover states
brand-900  (más oscuro) → texto sobre fondos claros
```

Regla de IBM Carbon: los tonos 500 e inferiores son aptos para texto oscuro sobre ellos; los 600 y superiores para texto claro.

### Accesibilidad del color (WCAG)

| Tipo de texto | Ratio mínimo (AA) | Ratio mejorado (AAA) |
|---------------|-------------------|----------------------|
| Texto normal (<18px) | 4.5:1 | 7:1 |
| Texto grande (≥18px o ≥14px bold) | 3:1 | 4.5:1 |
| Elementos UI e iconos | 3:1 | — |

**Nunca usar el color como único medio de comunicar información.** Complementar siempre con iconos, etiquetas o patrones.

### Semántica del color en UI

- **Azul**: Acción, información, links, estados interactivos.
- **Verde**: Éxito, confirmación, disponibilidad.
- **Amarillo/Ámbar**: Advertencia, atención, procesos pendientes.
- **Rojo**: Error, peligro, acciones destructivas.
- **Gris**: Neutral, deshabilitado, contenido secundario.

### Uso del color (de Shopify Polaris)

> El color destaca áreas importantes, comunica estado y urgencia, y dirige la atención. Úsalo con intención, no como decoración.

- No más de 2–3 colores de acento en una pantalla.
- Los fondos deben ser neutros para que los colores semánticos resalten.
- Mantener coherencia: si el azul es "acción", úsalo **solo** para acciones.

---

## 4. Tipografía

### Escala tipográfica

Usar una escala modular basada en ratios (1.25 o 1.333 son los más usados). Ejemplo con base 16px y ratio 1.25:

| Token | Tamaño | Uso |
|-------|--------|-----|
| `font-size-xs` | 12px | Captions, footnotes, badges |
| `font-size-sm` | 14px | Etiquetas, helper text |
| `font-size-md` (base) | 16px | Cuerpo de texto principal |
| `font-size-lg` | 20px | Intro text, subtítulos |
| `font-size-xl` | 24px | Headings menores (h3) |
| `font-size-2xl` | 32px | Headings medios (h2) |
| `font-size-3xl` | 40px | Headings principales (h1) |
| `font-size-4xl` | 48px+ | Display / Hero |

**Regla de oro**: El cuerpo de texto jamás debe ser menor a 16px efectivos.

### Line Height (interlineado)

Siguiendo WCAG 1.4.12 (Text Spacing):
- **Cuerpo de texto**: mínimo 1.5× el tamaño de fuente (ej: 16px → 24px).
- **Headings**: 1.2–1.3× es suficiente (ej: 32px → 38–42px).
- **Elementos cortos de UI** (botones, labels): 1.0–1.2.

### Letter Spacing (tracking)

- Texto en mayúsculas: +0.05–0.08em.
- Headings grandes: -0.01 a -0.02em (ligeramente apretado se ve más sofisticado).
- Cuerpo: 0 (sin ajuste, dejar al tipo).

### Medida de línea (line length)

- Rango óptimo para lectura: **45–90 caracteres por línea**.
- Ideal: ~66 caracteres.
- Nunca permitir líneas de más de 90 caracteres en textos largos.
- En mobile: 35–50 caracteres es adecuado.

### Jerarquía y uso semántico

Separar estilos de HTML semántico. Usar T-shirt sizing para los estilos CSS:

```css
/* ✅ Correcto: el estilo no dicta la jerarquía HTML */
.title-xl { font-size: var(--font-size-2xl); }
.title-md { font-size: var(--font-size-xl); }
.body-lg   { font-size: var(--font-size-lg); }

/* ❌ Incorrecto: acopla estilo con estructura */
h1 { font-size: ... }
h2 { font-size: ... }
```

### Grid de 4px para tipografía

Redondear todos los font-sizes y line-heights al múltiplo de 4px más cercano. Esto evita desalineaciones en componentes.

---

## 5. Espaciado y Layout

### Sistema de espaciado basado en múltiplos de 4 (o 8)

La mayoría de los grandes sistemas (Carbon, Polaris, Material) usan una base de **4px** o **8px**:

| Token | Valor (base 4px) | Uso típico |
|-------|-----------------|------------|
| `space-1` | 4px | Gaps mínimos, inline spacing |
| `space-2` | 8px | Padding pequeño de componentes |
| `space-3` | 12px | Spacing interno compacto |
| `space-4` | 16px | **Base**: padding estándar de componentes |
| `space-5` | 20px | Padding medio |
| `space-6` | 24px | Separación entre componentes relacionados |
| `space-8` | 32px | Separación entre secciones |
| `space-10` | 40px | Secciones grandes |
| `space-12` | 48px | Secciones de página |
| `space-16` | 64px | Hero sections, separadores grandes |

**Nunca usar valores arbitrarios** como 11px, 17px o 23px. Si no está en la escala, hay que justificarlo.

### Grid de layout

- Usar un sistema de columnas (12 columnas es el estándar).
- Definir breakpoints consistentes:

| Breakpoint | Valor | Dispositivo |
|-----------|-------|-------------|
| `xs` | < 480px | Móvil pequeño |
| `sm` | 480–767px | Móvil |
| `md` | 768–1023px | Tablet |
| `lg` | 1024–1279px | Desktop |
| `xl` | 1280–1535px | Desktop ancho |
| `2xl` | ≥ 1536px | Pantalla grande |

- El `max-width` del contenido principal: típicamente **1280px** o **1440px**.
- Gutters (separación entre columnas): 16px en mobile, 24px en desktop.

### Reglas de spacing en componentes

- Usar **padding horizontal > padding vertical** en la mayoría de los elementos de texto.
- Consistencia direccional: si un botón tiene 16px de padding horizontal, todos los botones del mismo tamaño deben tenerlo.
- Separación entre elementos relacionados: pequeña. Entre grupos no relacionados: grande.

---

## 6. Componentes

### Anatomía de un buen componente

Todo componente debe definir:
1. **Variantes** (primary, secondary, ghost, destructive…).
2. **Tamaños** (sm, md, lg).
3. **Estados** (default, hover, focus, active, disabled, loading, error).
4. **Slots de contenido** (ej: icono izquierdo, icono derecho, texto).
5. **Comportamiento de accesibilidad** (roles ARIA, keyboard nav).

### Botones

- Jerarquía visual obligatoria: primario > secundario > terciario/ghost.
- Solo un botón primario por vista/modal.
- Botones destructivos (eliminar, desactivar) deben ser visualmente distintos (rojo/outlined).
- El estado `:focus` debe ser siempre visible (outline mínimo de 3:1 contraste).
- Tamaño mínimo de área táctil: **44×44px** (Apple HIG / WCAG 2.5.5).
- No usar solo iconos en botones sin tooltip o aria-label.

### Formularios

- Cada campo debe tener un `label` visible (nunca solo placeholder como label).
- Mensajes de error: específicos ("El email debe incluir @"), no genéricos ("Campo inválido").
- Errores deben aparecer **debajo del campo**, en rojo, con icono.
- Agrupar campos relacionados (nombre + apellido, teléfono + código de país).
- Marcar los campos opcionales, no los obligatorios (inversión que reduce fricción cognitiva).
- Campos de texto de una sola línea: altura mínima 40–44px.

### Tablas de datos

- Siempre incluir encabezados de columna con `scope="col"`.
- Permitir ordenación por columna cuando sea útil.
- Para datos numéricos: alinear a la derecha. Para texto: izquierda.
- Filas con hover state para facilitar el seguimiento visual.
- En mobile: considerar scroll horizontal o transformar en cards.

### Modales y overlays

- Bloquear scroll del fondo cuando el modal está abierto.
- El foco debe moverse al modal al abrirse y volver al trigger al cerrarse (focus trap).
- Siempre incluir cierre con Escape.
- No más de 3 acciones en un modal.
- Evitar modals en mobile cuando sea posible; preferir bottom sheets o páginas nuevas.

### Navegación

- Máximo 7 ítems en la nav principal.
- Destacar claramente el item activo.
- En mobile: hamburger menu o tab bar inferior (máximo 5 ítems en tab bar).
- Breadcrumbs para jerarquías profundas (más de 2 niveles).

### Estados vacíos (Empty States)

- Nunca mostrar una pantalla en blanco. Incluir siempre: ilustración/icono + texto explicativo + CTA.
- El mensaje debe explicar **por qué** está vacío y **qué puede hacer** el usuario.

### Loading States

- Para acciones cortas (<300ms): no mostrar loader (evita el "flash").
- Para acciones medias (300ms–3s): spinner o skeleton.
- Para acciones largas (>3s): progress bar con feedback de texto.
- Los skeleton loaders deben replicar la forma del contenido que van a mostrar.

---

## 7. Accesibilidad

La accesibilidad no es un extra. Es una obligación legal (ADA, European Accessibility Act 2025) y una mejora para todos los usuarios.

### Estándar objetivo: WCAG 2.2 AA

### Los cuatro principios (POUR)

1. **Perceptible**: La información debe ser presentable de múltiples formas.
2. **Operable**: La interfaz debe ser operable con teclado y sin precisión extrema.
3. **Comprensible**: El contenido y la operación deben ser comprensibles.
4. **Robusto**: El contenido debe funcionar con tecnologías asistivas actuales y futuras.

### Checklist esencial

**Color y contraste**
- [ ] Texto normal: ratio ≥ 4.5:1.
- [ ] Texto grande o bold: ratio ≥ 3:1.
- [ ] Componentes UI e iconos significativos: ratio ≥ 3:1.
- [ ] No usar solo el color para transmitir información.

**Teclado**
- [ ] Toda la funcionalidad es accesible por teclado.
- [ ] El orden de tabulación es lógico y sigue el flujo visual.
- [ ] El foco es siempre visible (outline claramente contrastado).
- [ ] No hay "trampas de teclado" donde el foco quede atrapado.

**Texto y contenido**
- [ ] Todas las imágenes tienen `alt` descriptivo (o `alt=""` si son decorativas).
- [ ] Los iconos sin texto tienen `aria-label` o `title`.
- [ ] Los encabezados forman una jerarquía lógica (h1 → h2 → h3).
- [ ] El tamaño de fuente mínimo del cuerpo es 16px.

**Formularios**
- [ ] Todos los inputs tienen `<label>` asociado.
- [ ] Los errores se anuncian a lectores de pantalla (`role="alert"` o `aria-live`).
- [ ] Los campos requeridos están marcados semánticamente (`aria-required`).

**Movimiento**
- [ ] Respetar `prefers-reduced-motion` para animaciones.
- [ ] Ningún elemento parpadea más de 3 veces por segundo.
- [ ] Las animaciones no son el único medio de comunicar un cambio de estado.

**Estructura**
- [ ] El HTML tiene landmarks semánticos (`<main>`, `<nav>`, `<header>`, `<footer>`).
- [ ] Hay un skip link al inicio para saltar la navegación.
- [ ] El idioma del documento está declarado (`<html lang="es">`).

### ARIA: cuándo y cómo usarlo

Regla de oro: **HTML semántico primero, ARIA solo cuando sea necesario.**

```html
<!-- ✅ Preferido: HTML semántico -->
<button type="button">Guardar</button>

<!-- Solo si el elemento no es nativamente interactivo -->
<div role="button" tabindex="0" aria-label="Cerrar modal">×</div>
```

No duplicar roles que ya tiene el elemento (`<button role="button">` es redundante).

---

## 8. Movimiento y Animación

### Principios de movimiento (de Material Design y Shopify)

El movimiento debe:
- **Ser funcional**: Comunicar cambios de estado, orientar al usuario, dar feedback.
- **Ser sutil**: Las animaciones no deben distraer ni ralentizar las tareas.
- **Ser consistente**: Usar las mismas duraciones y easings en toda la app.

### Tokens de movimiento

```css
:root {
  /* Duraciones */
  --duration-instant:  100ms;  /* Micro-feedback (ripple, hover) */
  --duration-fast:     150ms;  /* Aparecer/desaparecer elementos pequeños */
  --duration-normal:   250ms;  /* Transiciones estándar */
  --duration-slow:     400ms;  /* Elementos grandes, modales, slides */
  --duration-slower:   600ms;  /* Transiciones de página */

  /* Easings */
  --easing-standard:   cubic-bezier(0.4, 0, 0.2, 1);   /* La mayoría de las transiciones */
  --easing-decelerate: cubic-bezier(0, 0, 0.2, 1);     /* Entrar a la pantalla */
  --easing-accelerate: cubic-bezier(0.4, 0, 1, 1);     /* Salir de la pantalla */
  --easing-bounce:     cubic-bezier(0.34, 1.56, 0.64, 1); /* Acciones exitosas */
}
```

### Reglas de uso

- **Hover**: 150ms, opacity o color.
- **Focus**: Inmediato o 100ms (la accesibilidad no debe tener delay).
- **Aparición de elementos** (tooltips, dropdowns): 150–200ms ease-out.
- **Modales/drawers**: 250–350ms con slide + fade.
- **Transiciones de página**: 300–400ms.
- **Nunca** animar más de 200–300ms en acciones frecuentes (botones, inputs).

### prefers-reduced-motion

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

---

## 9. Contenido y Voz

### Principios de escritura en UI

Todos los grandes sistemas (Mailchimp, Shopify, Atlassian, GOV.UK) coinciden en:

- **Claridad sobre elegancia**: Una frase simple y directa siempre gana.
- **Hablar como una persona**: Usar lenguaje conversacional, no corporativo.
- **Orientado a la acción**: Los botones y CTAs deben describir la acción, no el resultado.
- **Concisión**: Si se puede decir en 5 palabras en vez de 10, usar 5.

### Botones y CTAs

| ✅ Correcto | ❌ Incorrecto |
|-----------|-------------|
| "Guardar cambios" | "OK" |
| "Eliminar proyecto" | "Confirmar" |
| "Crear nueva cuenta" | "Submit" |
| "Descargar informe" | "Haz clic aquí" |

El texto del botón debe describir exactamente qué pasará al hacer clic.

### Mensajes de error

- Evitar culpar al usuario: no "Error de usuario" sino "No pudimos completar la acción".
- Ser específico: no "Ha ocurrido un error" sino "El archivo supera el límite de 10 MB".
- Ofrecer solución cuando sea posible: "Inténtalo de nuevo" o "Contacta soporte".

### Mensajes vacíos y de carga

- Vacío: Explicar **por qué** y **qué hacer a continuación**.
- Carga: Usar verbos en gerundio ("Cargando tus proyectos…") o progreso concreto ("Paso 2 de 3").

### Microcopy de formularios

- Placeholders: solo para ejemplos del formato esperado (`ej: usuario@empresa.com`), nunca como label.
- Helper text: debajo del campo, en texto secundario, para instrucciones permanentes.
- Error text: debajo del campo, en rojo, aparecer tras el intento de submit o al perder el foco.

---

## 10. Responsive y Multiplataforma

### Mobile First

Diseñar la experiencia móvil primero y luego expandir a desktop. No adaptar desktop a mobile como segunda opción.

### Áreas táctiles

- Tamaño mínimo: **44×44px** (Apple HIG, Material).
- Spacing mínimo entre targets táctiles: **8px**.
- Los elementos interactivos en listas deben tener la fila completa como área táctil.

### Patrones de adaptación

| Patrón | Descripción |
|--------|-------------|
| **Reflow** | El contenido se reorganiza en columna en mobile |
| **Reveal** | La navegación se oculta en un menú en mobile |
| **Transform** | Una tabla se convierte en cards en mobile |
| **Collapse** | Acordeones para contenido no esencial en mobile |
| **Replace** | Componente distinto por breakpoint (tab bar vs sidebar) |

### Imágenes y media

- Usar formatos modernos: WebP, AVIF.
- Definir tamaños con `srcset` para cargar la imagen apropiada.
- Aspect ratios fijos para evitar layout shifts (CLS).

---

## 11. Dark Mode y Temas

### Implementación correcta con tokens semánticos

La clave es que el dark mode **redefine los tokens semánticos**, no los colores primitivos.

```css
:root {
  /* Light mode (default) */
  --color-bg-surface: #FFFFFF;
  --color-bg-subtle: #F5F5F5;
  --color-text-primary: #111111;
  --color-text-secondary: #555555;
  --color-border-default: #E0E0E0;
  --color-action-primary: #0066FF;
}

[data-theme="dark"] {
  /* Dark mode: solo redefinir los semánticos */
  --color-bg-surface: #1A1A1A;
  --color-bg-subtle: #242424;
  --color-text-primary: #F0F0F0;
  --color-text-secondary: #A0A0A0;
  --color-border-default: #333333;
  --color-action-primary: #4D94FF; /* más claro para contraste en fondo oscuro */
}
```

### Reglas para dark mode

- **No invertir simplemente**: el negro no es blanco invertido. Usar paletas específicas.
- Los fondos oscuros tienen capas de elevación basadas en opacidad (no en sombras).
- Las sombras en dark mode son menos efectivas; compensar con bordes o elevation tints.
- El color de acción primario necesita ser más claro en dark mode para mantener el contraste.
- Nunca usar negro puro (#000000) como fondo; usar tonos oscuros (ej: #121212, #1A1A1A).

### Respetar la preferencia del sistema

```css
@media (prefers-color-scheme: dark) {
  :root { /* aplicar tokens dark */ }
}
```

---

## 12. Iconografía

### Principios

- **Consistencia de estilo**: No mezclar iconos outlined, filled y duotone en la misma interfaz.
- **Significado universal**: Preferir iconos con significado establecido (lupa = buscar, casa = inicio).
- **Siempre con texto cuando sea posible**: No depender solo del icono para acciones críticas.
- **Tamaño consistente**: 16, 20 o 24px según el contexto. No escalar arbitrariamente.

### Accesibilidad de iconos

```html
<!-- Icono decorativo (el texto lo explica todo) -->
<button>
  <svg aria-hidden="true" focusable="false">...</svg>
  Guardar
</button>

<!-- Icono como único contenido -->
<button aria-label="Cerrar">
  <svg aria-hidden="true" focusable="false">...</svg>
</button>
```

- `aria-hidden="true"` en el SVG para que el lector de pantalla lo ignore.
- `focusable="false"` en SVG para evitar que reciba foco en IE/Edge antiguos.

---

## 13. Patrones de Interacción

### Feedback de acciones

Toda acción del usuario debe recibir respuesta visual:

| Acción | Feedback |
|--------|---------|
| Hover | Cambio de color/cursor (150ms) |
| Click/Tap | Ripple, depresión visual o cambio de estado (100ms) |
| Acción exitosa | Toast/banner verde + posible cambio de estado del elemento |
| Error | Mensaje de error inline + shake animation suave |
| Cargando | Skeleton o spinner mientras se procesa |
| Acción destructiva | Dialog de confirmación obligatorio |

### Toasts y Notificaciones

- Duración: 4–7 segundos para mensajes informativos.
- Errores críticos: no auto-cerrar, requieren acción del usuario.
- Posición: esquina inferior derecha en desktop, parte superior en mobile.
- Máximo 3 toasts apilados visibles a la vez.
- Siempre incluir opción de cierre manual.

### Formularios: UX de validación

- Validar **al perder el foco** (onBlur), no al escribir (evita errores prematuros).
- Excepción: contraseñas y confirmación de contraseña pueden validar en tiempo real.
- Mostrar requisitos del campo **antes** de que el usuario cometa el error.
- Al intentar enviar un formulario con errores: hacer scroll al primer campo con error.

### Infinite Scroll vs Paginación

- **Infinite scroll**: contenido exploratorio (feeds, galería).
- **Paginación**: contenido con navegación intencional (tablas, resultados de búsqueda donde el usuario vuelve atrás).
- Nunca usar infinite scroll donde el usuario necesita recordar su posición o compartir una URL de página específica.

---

## 14. Reglas para Claude

Esta sección traduce las mejores prácticas anteriores en **instrucciones directas** para cuando Claude diseñe o evalúe interfaces.

### Al crear cualquier componente o UI:

1. **Usar CSS Custom Properties** para todos los valores visuales. Nunca hardcodear `#0066FF` directamente; usar `var(--color-action-primary)`.

2. **Respetar la escala de 4px** para todos los spacings y tamaños. Los valores de padding, margin y gap deben ser múltiplos de 4 (4, 8, 12, 16, 20, 24, 32, 40, 48, 64…).

3. **Tamaño mínimo de fuente**: 16px para cuerpo de texto. Nunca menor.

4. **Line-height mínimo**: 1.5 para cuerpo de texto. 1.2–1.3 para headings.

5. **Áreas táctiles**: Los elementos interactivos (botones, links, checkboxes) deben tener al menos 44×44px de área táctil.

6. **Focus visible siempre**: Toda interfaz debe incluir estilos `:focus-visible` explícitos, nunca `outline: none` sin reemplazo.

7. **Jerarquía de botones**: Un solo botón primario por sección. Los botones secundarios siempre visualmente subordinados.

8. **Mensajes de error específicos**: No "Error", sino qué salió mal y cómo solucionarlo.

9. **Estados vacíos**: Nunca dejar un contenedor vacío sin mensaje explicativo + CTA.

10. **prefers-reduced-motion**: Incluir siempre el media query para reducir/eliminar animaciones.

11. **Contraste mínimo AA**: Verificar que el texto sobre fondos tenga ratio ≥ 4.5:1 (texto normal) o ≥ 3:1 (texto grande).

12. **No usar color solo**: Si un color comunica algo (éxito, error, advertencia), incluir siempre un icono o etiqueta de texto.

13. **HTML semántico primero**: Usar `<button>`, `<nav>`, `<main>`, `<section>`, etc. antes de recurrir a divs con roles ARIA.

14. **Placeholders ≠ Labels**: Siempre incluir `<label>` visibles en formularios.

15. **Dark mode**: Si se implementa, usar tokens semánticos redefinidos. Nunca invertir colores directamente.

16. **Máximo de complejidad visual**: En cualquier vista, no más de 3 niveles de jerarquía visual, 2–3 colores de acento, y 2 familias tipográficas.

17. **Consistencia en el estilo de iconos**: No mezclar estilos (outlined, filled, duotone).

18. **Longitud de línea**: En textos corridos, aplicar `max-width` entre 45ch y 75ch.

19. **Skeleton loaders**: Representar la forma del contenido que va a aparecer (no un spinner genérico).

20. **Textos de botones descriptivos**: El CTA siempre describe la acción exacta ("Guardar cambios", no "OK").

---

## Referencias

Los sistemas consultados para elaborar este documento:

- [IBM Carbon](https://carbondesignsystem.com) — Enterprise, accesibilidad, tokens
- [Shopify Polaris](https://polaris.shopify.com) — Componentes, motion, contenido
- [Google Material Design](https://material.io) — Color, tipografía, movimiento
- [Microsoft Fluent UI](https://fluent2.microsoft.design) — Accesibilidad, multiplataforma
- [GitHub Primer](https://primer.style) — Tokens, componentización, sencillez
- [Adobe Spectrum](https://spectrum.adobe.com) — Sistema de color, temas
- [Atlassian Design System](https://atlassian.design) — Patrones colaborativos, tokens
- [Salesforce Lightning](https://lightningdesignsystem.com) — Enterprise, formularios
- [GOV.UK Design System](https://design-system.service.gov.uk) — Accesibilidad, claridad de contenido
- [U.S. Web Design System](https://designsystem.digital.gov) — Tipografía, spacing
- [Twilio Paste](https://paste.twilio.design) — Tokens semánticos, temas
- [HashiCorp Helios](https://helios.hashicorp.design) — Documentación, componentes

---

*Última revisión: Abril 2026*
