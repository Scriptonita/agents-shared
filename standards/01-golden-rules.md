# 01 · Reglas de oro comunes

**Cuándo leerlo:** siempre, en cualquier repo y para cualquier tarea. Después lee las de
tu lado: [01.1 (librerías npm)](01.1-golden-rules-npm-libraries.md) o
[01.2 (apps front)](01.2-golden-rules-frontend-apps.md).

1. **Rama + pull request, siempre.** Nunca merge local a `main`/`master` ni push directo a
   la rama principal de un repo de código. La única excepción la declara el `CLAUDE.md` de
   cada repo (p. ej. un repo solo de documentación). Ver
   [02-git-and-pull-requests.md](02-git-and-pull-requests.md).
2. **Una fuente canónica por dato.** Cada regla de negocio, tipo, texto o token tiene un
   único sitio donde se define. Se cambia allí y se propaga a los consumidores (publicar
   versión → subir dependencia). Nunca se «arregla» en el consumidor una copia de algo cuya
   fuente vive en otro repo.
3. **Las copias declaran su origen.** Si un documento es copia de otro, lo dice en la
   cabecera y enlaza la fuente. Ante divergencia, gana la fuente canónica.
4. **Nada de secretos en el repo.** Ni tokens, ni contraseñas, ni `.env` con valores
   reales, ni un `.npmrc` con `_authToken`. Si aparece uno, se elimina, se avisa y se
   rota la credencial.
5. **Confirma antes de lo irreversible o externo.** *Commit*, *push*, publicar un paquete,
   renombrar o crear repos, borrar carpetas, cambiar datos de producción: se enseña qué se
   va a hacer y se espera aprobación explícita.
6. **Verifica antes de dar algo por hecho.** Tests, *typecheck*, *lint* y *build* del repo
   en verde antes de abrir la PR. Si algo falla y es preexistente, se demuestra contra
   `HEAD` y se dice; no se oculta.
7. **Idiomas:** documentación y comunicación en español; código, identificadores y
   commits en inglés. Ver [00-writing-in-spanish.md](00-writing-in-spanish.md).
8. **Rutas relativas.** Documentos y configuración usan rutas relativas a la carpeta raíz
   del espacio de trabajo o al repo, nunca rutas absolutas de una máquina.
9. **Lee solo lo necesario.** Empieza por [ARCHITECTURE-INDEX.md](../ARCHITECTURE-INDEX.md)
   y lee únicamente los estándares que indique para tu tarea.
10. **Deja rastro.** Lo que se aprende y vale para otros proyectos va a
    [knowledge-base.md](../knowledge-base.md); un cambio a estos estándares se propone en
    [proposals/](../proposals/README.md).
