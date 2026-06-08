# ¿Qué es el Diseño de Software? — Jack W. Reeves

> Resumen de estudio para examen final.
> Basado en *"Code as Design: Three Essays by Jack W. Reeves"* (developer.* Magazine).
> Cubre la **Introducción** y el **primer ensayo: "What Is Software Design?"** (publicado originalmente en C++ Journal, otoño de 1992).

---

## Introducción a los tres ensayos

Los tres ensayos de Jack W. Reeves giran en torno a una sola tesis central: **programar es fundamentalmente una actividad de diseño**, y la única representación final y verdadera del diseño de un sistema es el **código fuente mismo**. De esa afirmación, aparentemente simple, se desprende una discusión muy rica.

Los tres textos son:

1. **"What Is Software Design?"** (1992): el ensayo original, publicado en el ya desaparecido C++ Journal. Tras un período de oscuridad, ganó difusión gracias a la web y al libro de Robert Martin *Agile Software Development: Principles, Patterns, and Practices*. Es el que resumimos aquí.
2. **"What Is Software Design: 13 Years Later"** (2005): donde Reeves responde a las críticas más comunes que recibió.
3. **"Letter to the Editor"**: la carta original que dio origen a las ideas del primer ensayo.

Aunque las ideas siguen siendo frescas y controvertidas, con los años se volvieron conceptos clave detrás de corrientes como **Agile**, las metodologías basadas en *craft* (oficio), el **test-first design**, el **test-driven development (TDD)** y el **refactoring**.

---

## Tesis central del primer ensayo

> **La programación no se trata de *construir* software; se trata de *diseñar* software.**

Reeves sostiene que la industria del software ha pasado casi 10 años (al momento de escribir) sin captar una distinción sutil pero profunda: la diferencia entre **el proceso de hacer un diseño de software** y **lo que un diseño de software realmente es**.

Su conclusión: no somos verdaderos ingenieros de software porque no entendemos qué es realmente un diseño de software. La industria construyó **falsos paralelos con la ingeniería de hardware** y, al mismo tcompo, ignoró otros paralelos perfectamente válidos.

### El argumento clave: ¿cuál es el documento de diseño en software?

El objetivo final de toda actividad de ingeniería es producir algún tipo de **documentación**. Cuando el diseño se termina, la documentación se entrega al **equipo de manufactura**, que es un grupo distinto, con habilidades distintas. Si los documentos representan un diseño completo, ese equipo puede construir el producto (y muchas copias de él) sin más intervención de los diseñadores.

Reeves se pregunta: en el ciclo de vida del software, **¿qué documento cumple con ese criterio de un diseño de ingeniería?** Su respuesta:

> El único documento que satisface el criterio de un diseño de ingeniería es **el listado de código fuente**.

A partir de ahí, el ensayo **no intenta probar** que el código fuente es el diseño; lo **asume** y examina las consecuencias de esa suposición, mostrando que explica mejor muchos hechos observados de la industria (incluida la popularidad de C++).

---

## Las consecuencias de "el código es el diseño"

### Consecuencia 1: el software es baratísimo de *construir*

Si el código fuente es el diseño, entonces **la construcción del software la hacen los compiladores y los linkers** (lo que llamamos *"hacer un build"*).

- La inversión de capital para construir software es mínima: una computadora, un editor, un compilador y un linker.
- Una vez disponible el entorno, hacer un build cuesta solo un poco de tiempo.
- Comparación: compilar un programa de 50.000 líneas de C++ puede parecer eterno, **pero ¿cuánto tardaría construir un sistema de hardware con una complejidad de diseño equivalente?**

Este punto es tan obvio que se vuelve un **punto ciego** para la mayoría de las organizaciones: el software es **casi gratis** de construir.

### Consecuencia 2: un diseño de software es relativamente fácil de *crear* (mecánicamente)

Escribir (es decir, *diseñar*) un módulo típico de 50 a 100 líneas suele ser un par de días de trabajo (depurarlo por completo es otra historia). Como resultado, **los diseños de software se vuelven enormes y complejos muy rápido**:

- Proyectos escolares llegan a varios miles de líneas.
- Productos comerciales típicos tienen cientos de miles de líneas.
- Muchos diseños llegan a millones de líneas.
- Además, los diseños de software **evolucionan constantemente**: aunque el diseño actual tenga unos miles de líneas, a lo largo de la vida del producto se pueden haber escrito muchas veces más.

---

## Hardware vs. Software: por qué no debemos copiar al hardware

Reeves desmonta el mito de que el hardware es perfecto y el software un desastre:

- El hardware complejo **tampoco está libre de errores**: se han enviado microprocesadores con fallos lógicos, se cayeron puentes, se rompieron represas, cayeron aviones y se hicieron retiros masivos de automóviles, todos por **errores de diseño**.
- El hardware complejo tiene **fases de construcción caras y complejas**, lo que limita cuántas empresas pueden producirlo. **El software no tiene esa limitación**: hay miles de organizaciones y sistemas extremadamente complejos, y tanto el número como la complejidad crecen a diario.

**Conclusión:** la industria del software **no** resolverá sus problemas imitando a los desarrolladores de hardware. Si acaso, con CAD y CAM, **la ingeniería de hardware se está pareciendo cada vez más al desarrollo de software**.

Diseñar software es, en esencia, **un ejercicio de gestión de la complejidad**. Esa complejidad existe en tres niveles:

1. Dentro del propio diseño de software.
2. Dentro de la organización de la empresa.
3. Dentro de la industria como un todo.

El software se parece más a **sistemas sociales u orgánicos complejos** que al hardware: las especificaciones son fluidas y cambian rápido y a menudo (incluso durante el diseño), y los equipos también cambian a mitad de camino.

---

## Validación: testing y debugging *son* diseño

Los ingenieros de hardware validan y refinan sus diseños **antes** de construir: análisis estructural, modelos por computadora, simulaciones, modelos a escala, túneles de viento; para un avión nuevo incluso construyen prototipos a escala real para test de vuelo.

¿El software no valida? **Sí lo hace**, solo que no lo llamamos ingeniería:

> En software, validar y refinar el diseño se llama **testing y debugging**.

El motivo por el que no se reconoce esto como "ingeniería real" tiene que ver más con el **rechazo de la industria a aceptar el código como diseño** que con cualquier diferencia técnica real.

### Revelación 2: es más barato construir y probar que cualquier otra cosa

Como los builds **no cuestan casi nada** (tiempo mínimo, recursos recuperables), resulta más barato simplemente construir el diseño y probarlo que intentar demostrarlo formalmente.

- El testing **no solo busca corregir** el diseño actual: es parte del proceso de **refinarlo**.
- Aunque las demostraciones formales fueran tan automáticas como un compilador, **igual haríamos ciclos build/test**. Por eso las pruebas formales nunca tuvieron mucho interés práctico en la industria.

Esta es la realidad: diseños cada vez más complejos, hechos por cada vez más gente, codificados en algún lenguaje y luego **validados y refinados vía el ciclo build/test**. El proceso es propenso a errores y poco riguroso, y se agrava porque muchos desarrolladores **se niegan a creer** que funciona así.

---

## La crítica al modelo de proceso tradicional

Los procesos tradicionales intentan **segregar las fases** en compartimentos estancos: el diseño de alto nivel debe completarse y "congelarse" antes de escribir código; los programadores son los "obreros de la construcción"; el testing solo sirve para corregir errores de construcción.

Reeves argumenta que esto es un **modelo de proceso incorrecto**:

- Ninguna otra industria toleraría una **tasa de retrabajo de más del 100%** en manufactura. En software, hasta el código más pequeño suele reescribirse durante el testing. Eso es aceptable en un **proceso creativo de diseño**, no en uno de manufactura.
- Nadie espera que un ingeniero produzca un diseño perfecto a la primera; igual debe pasar por el proceso de refinamiento aunque sea perfecto, aunque sea para demostrarlo.
- Lección del management japonés: **es contraproducente culpar a los trabajadores por errores del proceso**. En lugar de forzar al software a un modelo equivocado, hay que **revisar el proceso** para que ayude en vez de estorbar.

> **La verdadera prueba de fuego de la "ingeniería de software":** la ingeniería se trata de **cómo se hace el proceso**, no de si el documento final necesita un sistema CAD para producirse.

---

## Todo es diseño, y todo interactúa

El problema central del desarrollo de software es que **todo es parte del proceso de diseño**:

- Codificar es diseño.
- Testing y debugging son diseño.
- Lo que solemos llamar "diseño de software" también es diseño.

El software es **barato de construir pero carísimo de diseñar**. Hay muchos aspectos de diseño y vistas resultantes, y **todos se interrelacionan**:

- Sería lindo que los diseñadores de alto nivel ignoraran los algoritmos de los módulos, y que los programadores ignoraran el alto nivel. Pero **los aspectos de una capa se entrometen en las otras**.
- La elección de algoritmos de un módulo puede ser tan importante para el éxito como cualquier decisión de alto nivel.
- **No hay jerarquía de importancia** entre aspectos: un error de diseño en el módulo más bajo puede ser tan fatal como uno en el nivel más alto.
- Un diseño de software debe ser **completo y correcto en todos sus aspectos**, o todos los builds basados en él serán erróneos.

Para manejar la complejidad, el software **se diseña en capas**: mientras un programador piensa en un módulo, hay cientos de otros módulos y miles de detalles que no puede atender a la vez.

### Por qué el diseño de alto nivel no puede "congelarse"

- El diseño **no está completo hasta que se codifica y se prueba**.
- El diseño estructural de alto nivel **no es un diseño completo**: es solo un **andamiaje** para el diseño detallado.
- Tenemos capacidad muy limitada para validar rigurosamente un diseño de alto nivel.
- El diseño detallado **debería influir** en el de alto nivel tanto como cualquier otro factor.
- Si **se "congela" algún aspecto** fuera del proceso de refinamiento, no sorprende que el diseño final sea pobre o inviable.

El software depende de demasiadas cosas (hardware que no funciona como se creía, una rutina de biblioteca con una restricción no documentada...). Esos problemas se descubren durante el testing porque **no había forma de descubrirlos antes**, y cuando aparecen, **fuerzan cambios** en el diseño que muchas veces se propagan (Ley de Murphy). Cuando una parte no puede cambiar, otras se debilitan para acomodarse: los gerentes lo perciben como *"hacking"*, pero es la **realidad del desarrollo**.

> **Craft vs. Engineering:** la experiencia nos lleva en la dirección correcta (eso es *craft*/oficio), pero solo hasta cierto punto en territorio desconocido. A partir de ahí, **mejorar lo que tenemos mediante un proceso controlado de refinamiento es ingeniería**.

---

## Notaciones de diseño y el rol de C++

- Un detalle conocido por todos: escribir los documentos de diseño **después** del código produce documentos mucho más precisos. La razón es clara: solo el diseño final, reflejado en el código, es el que se refina en el ciclo build/test. La probabilidad de que el diseño inicial quede sin cambios es **inversamente proporcional** a la cantidad de módulos y programadores; se vuelve casi cero.
- Necesitamos buen diseño en **todos los niveles**, especialmente buen diseño de alto nivel. Hay que usar **lo que ayude**: structure charts, diagramas de Booch, tablas de estado, PDL, etc.
- **PERO**: esas herramientas y notaciones **no son un diseño de software**. Tarde o temprano hay que crear el diseño real, y será en algún lenguaje de programación. Por eso **no hay que temerle a codificar los diseños mientras se derivan**, siempre dispuestos a refinarlos.

### El problema de la traducción y por qué C++

- No existe (aún) una notación de diseño igualmente apta para alto nivel y para diseño detallado. El diseño termina en algún lenguaje, así que las notaciones de alto nivel **deben traducirse** al lenguaje destino, y esa traducción **lleva tiempo e introduce errores**.
- Por eso conviene que **los diseñadores originales escriban el código original**, en vez de que otro traduzca después un diseño independiente del lenguaje.
- Lo que se necesita es **una notación unificada para todos los niveles**: un lenguaje de programación que también sirva para capturar conceptos de diseño de alto nivel. **Ahí entra C++.**

**Por qué C++ se volvió popular (según Reeves):** porque hace más fácil **diseñar software y programar al mismo tiempo**. Es un lenguaje apto para proyectos reales que además es **más expresivo como lenguaje de diseño**: permite expresar directamente información de alto nivel sobre los componentes, facilita producir y refinar el diseño, y con su chequeo de tipos más fuerte ayuda a detectar errores → un diseño más robusto y mejor "ingenierizado".

### La evidencia histórica

Lo que ganó popularidad fueron mejoras en **técnicas y lenguajes de programación reales** (programación estructurada → Pascal; diseño orientado a objetos → C++). Lo que **no** funcionó de forma universal: herramientas CASE, structure charts, diagramas de Warner-Orr, de Booch, de objetos. Cada uno tiene fortalezas pero **una debilidad fundamental: no son un diseño de software**. La única notación de diseño verdaderamente extendida es PDL (que, justamente, se parece al código).

Esto sugiere que **el subconsciente colectivo de la industria sabe** que mejorar los lenguajes y técnicas de programación importa más que cualquier otra cosa, y que **a los programadores les interesa el diseño**.

Lo mismo con la evolución del proceso: del modelo en cascada (*waterfall*) pasamos al **desarrollo en espiral y el prototipado rápido**. Más allá de justificarse con términos como "mitigación de riesgos" o "menor tiempo de entrega", en el fondo son **excusas para empezar a codificar antes**, lo cual es bueno: permite que el ciclo build/test empiece a validar y refinar el diseño más temprano, y que los mismos diseñadores del alto nivel sigan presentes para el diseño detallado.

---

## Documentación auxiliar

El objetivo de un proyecto de ingeniería es producir documentación, pero los documentos de diseño (el código) no son los únicos necesarios. Más allá de manuales de usuario y guías de instalación, hay **dos necesidades** que requieren documentación auxiliar:

1. **Capturar información del espacio del problema** que no llegó directamente al diseño. Diseñar software es inventar conceptos de software para modelar conceptos del problema; en el camino se gana entendimiento que **no queda modelado** en el código pero que ayudó a decidir, y conviene guardarlo por si hay que cambiar el modelo.
2. **Documentar aspectos del diseño difíciles de extraer del propio código**, tanto de alto como de bajo nivel. Muchos se representan mejor de forma **gráfica**, lo que dificulta ponerlos como comentarios en el código.

Puntos importantes sobre la documentación auxiliar:

- Esto **no** es un argumento a favor de una notación gráfica en lugar del lenguaje; es análogo a las descripciones textuales que acompañan los planos en hardware.
- **El código fuente determina cuál es el diseño real, no la documentación auxiliar.**
- Lo ideal serían herramientas que **generen la documentación auxiliar a partir del código**; mantenerla a mano y al día es difícil (otro argumento para tener lenguajes más expresivos).
- Conviene mantener la documentación auxiliar **al mínimo y lo más informal posible** hasta lo más tarde posible en el proyecto.

---

## Resumen final del autor (puntos para memorizar)

1. El **software real** corre en computadoras: es una secuencia de unos y ceros en un medio magnético. **No** es un listado en C++ ni en ningún lenguaje.
2. Un **listado de programa es un documento que representa un diseño** de software. Los compiladores y linkers son los que realmente **construyen** los diseños.
3. El software real es **increíblemente barato de construir** (y cada vez más, con computadoras más rápidas).
4. El software real es **increíblemente caro de diseñar**, porque es muy complejo y porque casi todos los pasos de un proyecto son parte del diseño.
5. **Programar es una actividad de diseño**: un buen proceso lo reconoce y no duda en codificar cuando tiene sentido.
6. **Codificar tiene sentido más a menudo de lo que se cree**: el acto de plasmar el diseño en código revela omisiones y necesidades de más diseño; cuanto antes ocurra, mejor.
7. Como el software es tan barato de construir, los **métodos formales de validación** de la ingeniería no sirven mucho: es más fácil y barato construir y probar que demostrar.
8. **Testing y debugging son actividades de diseño**: el equivalente a la validación y el refinamiento de otras ingenierías. Un buen proceso no los recorta.
9. **Hay otras actividades de diseño** (alto nivel, módulos, estructural, arquitectónico): un buen proceso las incluye deliberadamente.
10. **Todas las actividades de diseño interactúan**: un buen proceso permite que el diseño cambie, a veces radicalmente, cuando algún paso revela la necesidad.
11. **Muchas notaciones de diseño son útiles** como documentación auxiliar y como ayuda al proceso, pero **no son** un diseño de software.
12. El desarrollo de software es **todavía más un oficio (craft) que una ingeniería**, principalmente por la falta de rigor en validar y mejorar el diseño.
13. Los avances reales dependen de **avances en las técnicas y lenguajes de programación**. C++ es uno de esos avances, popular justamente porque **soporta directamente un mejor diseño de software**.
14. C++ es un paso en la dirección correcta, **pero hacen falta más avances**.

---

## Ideas clave para el examen (en una línea)

- **Tesis:** el código fuente *es* el diseño; programar *es* diseñar.
- **Distinción central:** *diseñar software* (proceso) ≠ *un diseño de software* (producto = el código).
- **Las dos "revelaciones":** (1) construir software es casi gratis; (2) es más barato construir y testear que validar formalmente.
- **Manufactura del software = compilar y linkear** (lo hacen las máquinas, no los programadores).
- **Testing y debugging = validación y refinamiento del diseño** (no control de calidad de "obreros").
- **Ingeniería = cómo se hace el proceso**, no si el resultado se ve "bonito" en un CAD.
- **Las notaciones (UML, Booch, structure charts, CASE) no son el diseño**; el diseño termina siempre en un lenguaje de programación.
- **El software se parece a sistemas orgánicos/sociales**, no al hardware; manejar su complejidad es la esencia del diseño.
