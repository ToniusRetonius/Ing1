# Resumen conceptual — Segundo ensayo

## "What Is Software Design: 13 Years Later" (2005) — Jack W. Reeves

> Foco **conceptual**: las ideas centrales y la estructura de los argumentos.

Trece años después, Reeves **no cambia su tesis**; la defiende respondiendo a las críticas más comunes que recibió. Todo el ensayo gira alrededor de **una distinción que, según él, la gente se niega a entender**:

> **Diseño como *proceso* ≠ Diseño como *producto*.**

Es la diferencia entre *escribir* un trabajo (el proceso) y *el trabajo* en sí (el producto). Confundir ambas cosas es la raíz de casi todos los malentendidos sobre su idea. El ensayo está organizado como una réplica a cuatro críticas (A, B, B', C, D).

### Crítica A — "Si el código es el diseño, los programadores serían diseñadores; pero no lo son, luego el código no es el diseño"

Reeves lo desarma como una **falacia de petición de principio** (*begging the question*): el argumento **parte de asumir** que programar es una actividad de *manufactura* (el programador como operario de línea de montaje) y, desde esa premisa, concluye que el código no puede ser diseño. Es circular: rechaza su conclusión solo porque choca con un supuesto previo.

Aclaración importante sobre su propio método: él **no pretende demostrar** que "el código es el diseño". Reconoce que qué es un "diseño" es, en parte, una cuestión de **definición**. Lo que afirma es que **asumir** que el código es el diseño **explica mejor** los hechos observados de la industria que cualquier supuesto alternativo, y sigue esperando que alguien proponga una explicación mejor.

### Crítica B — "Decir que el código es el diseño es decir 'no diseñes, solo codificá'"

La que más lo irrita, porque **nunca dijo eso**. Vuelve a la distinción proceso/producto:

- **Necesitamos buen diseño en todos los niveles.** En lenguaje más actual: buenas **arquitecturas** (alto nivel), buenas **abstracciones** (diseño de clases) y buenas **implementaciones** (bajo nivel). Usar UML o tarjetas CRC para explorar alternativas está perfectamente bien.
- **PERO** esas herramientas y notaciones **no son** el diseño de software. El diseño real termina en un lenguaje de programación.
- Lo fundamental: **el proceso no está completo hasta que se escribió y se probó el código.**

Sobre *cómo* pensar el diseño, su postura es **liberal**: alguien con los pies sobre el escritorio mirando el techo puede estar "diseñando" tan en serio como quien juega con diagramas UML. Cada uno piensa distinto (papel, pizarra, UML, CRC, conversando, en silencio). **Lo que importa es el código resultante**, no el método para llegar:

- Si el código es bueno, ¿importa cómo se llegó a él?
- Si el código es malo, ¿importa cuánta documentación se hizo antes de escribirlo mal?

Y rechaza la idea de un **"punto medio" de cantidad de diseño**: *no existe* esa dosis exacta. **No hay bala de plata ni "manera correcta" de diseñar.** A veces una hora (o una semana) de pensar antes ahorra mucho; otras veces 5 minutos de testing revelan algo que jamás se te habría ocurrido. La única validación real es **construir y probar**.

Cierre de la sección: **el código fuente no es la *única* documentación necesaria** (la auxiliar también importa); es el **documento maestro** de diseño, pero rara vez el único.

### Crítica B' — "¿Y el programador menos capaz?" (el argumento del *Less Able Programmer*)

La idea criticada: como solo los mejores pueden "diseñar y codificar" a la vez, hay que imponer pasos y productos intermedios para compensar al programador promedio.

Reeves lo compara con preguntar "¿qué hacemos con el médico menos capaz?". La medicina igual **exige altos estándares** de inteligencia, formación y experiencia antes de dejarte ejercer. En software, esta crítica equivale a **querer sustituir inteligencia, aptitud y experiencia por proceso**. No hay evidencia de que llenar de diagramas y revisiones haga que alguien termine entendiendo y codificando bien. De hecho, **usar bien herramientas como UML ya requiere su propia experiencia**.

### Crítica C — "La meta de la ingeniería es un *producto*, no documentación"

Algunos dicen que los ingenieros "construyen cosas" y esas cosas son tan producto de la ingeniería como cualquier documento. Reeves contesta que eso **esquiva la pregunta**. Admite que hay ingenieros que construyen con poca o ninguna documentación formal, pero esos suelen ser **productos únicos (one-off), hechos por individuos**.

En cuanto la ingeniería **involucra a más de un par de personas o tiene una fase formal de manufactura**, la documentación pasa a ser cada vez más **el verdadero producto** del esfuerzo de ingeniería (Toyota, Motorola, Boeing, Lockheed sí producen documentación). La pregunta filosa: cualquiera que se llame ingeniero **sabe cómo luce un documento de diseño** en su campo. ¿Pueden decir lo mismo los "ingenieros de software"?

### Crítica D — "El código fuente es demasiado alto nivel; es una *especificación*, el diseño real es lo que sale del compilador"

Reeves apela a la definición estándar:

- **Especificación = el *qué*.**
- **Diseño = el *cómo*.**

El compilador tiene cierta flexibilidad para decidir el *cómo* del código objeto, pero **no hay creatividad** en ello. Y ahí traza la línea:

> Cuando un documento es lo bastante detallado, completo y **no ambiguo** como para interpretarse **mecánicamente** (por una computadora o por un operario), es un **documento de diseño**. Si todavía requiere **interpretación humana creativa**, no lo es.

En desarrollo de software, ese documento de diseño es **el listado de código fuente**.

---

### Ideas clave del ensayo 2 (para fijar)

- **Distinción que ordena todo:** diseño como **proceso** vs. diseño como **producto**.
- No pretende *probar* "el código es el diseño": lo **asume** porque **explica mejor** los hechos.
- "El código es el diseño" **no** significa "no diseñes": el proceso recién termina **cuando el código está escrito y probado**.
- **No existe** la dosis exacta de diseño ni la "manera correcta": la única validación es **build/test**.
- No se puede **sustituir experiencia por proceso** (programador menos capaz).
- **Especificación = qué / Diseño = cómo** interpretable mecánicamente, sin creatividad → el diseño es el **listado de código fuente**.
