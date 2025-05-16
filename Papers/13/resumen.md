# Modern Software Engineering - David Farley 
David Farley es un reconocido experto en desarrollo de software, especialmente en prácticas relacionadas con entrega continua (continuous delivery) y metodologías ágiles. 

## Chapter 1
### Engineering—The Practical Application of Science
David sostiene que el desarrollo de software es un proceso de descubrimiento y exploración, por lo que los ingenieros de software deben volverse expertos en aprender. Para ello, se propone adoptar los principios básicos del método científico (*characterize*, *hypothesize, *predict*, *experiment*) de forma pragmática. No se trata de aplicar ciencia con precisión extrema, sino de usar sus estrategias para reducir riesgos, mejorar la toma de decisiones y avanzar más rápido.

### What Is Software Engineering?
La definición de ingeniería de software propuesta es :
 * *La aplicación de un enfoque empírico y científico para encontrar soluciones eficientes y económicas a problemas prácticos en software.* 
Este enfoque es clave porque el desarrollo de software es siempre un ejercicio de descubrimiento y aprendizaje, y para ser eficientes y económicos, el aprendizaje debe ser *sostenible*.

Debemos convertirnos en expertos en aprendizaje y en gestión de la complejidad. Para aprender, necesitamos: *iteration*, *feedback*, *incrementalism*, *experimentation* y *empirism*. Esta es una forma evolutiva de crear sistemas complejos, mediante pequeños pasos, explorando y reaccionando al éxito o al fracaso.

Para gestionar la complejidad, necesitamos: *modularity*, *cohesion*, *separation of concerns*, *abstraction* y *loose coupling*. Aunque conocidas, estas ideas deben organizarse en un enfoque coherente.

Además, propone herramientas prácticas para guiar una estrategia efectiva de desarrollo: *testability*, *deployability*, *speed*, *controlling variables* y *continuous delivery*.

Aplicar estos principios produce resultados profundos: software de mayor calidad, trabajo más rápido, equipos más satisfechos, con menos estrés y mejor equilibrio entre vida y trabajo. Estos beneficios están respaldados por datos.

### Reclaiming “Software Engineering”
El autor reflexiona sobre el título, mencionando que la industria ha redefinido tanto el término "ingeniería" en el contexto del software que ha perdido su valor. En el software, ingeniería a menudo se reduce a simplemente "código" o se asocia con burocracia excesiva. Sin embargo, en otras disciplinas, ingeniería significa simplemente *"stuff that works"*, es decir, el proceso y la práctica que aumentan las probabilidades de hacer un buen trabajo.

El autor argumenta que si nuestras prácticas de "ingeniería de software" no nos permiten crear mejor software más rápido, entonces no estamos realmente haciendo ingeniería, y debemos cambiarlas. La idea central es ofrecer un modelo consistente intelectualmente que combine principios fundamentales esenciales para el desarrollo de software de calidad. Aunque el éxito no está garantizado, aplicar estas herramientas mentales y principios organizadores aumentará las posibilidades de éxito.

### How to Make Progress
El desarrollo de software es una actividad compleja y sofisticada, posiblemente una de las más complejas que realiza nuestra especie. Es absurdo pensar que cada persona o equipo deba inventar desde cero cómo abordarlo en cada nuevo proyecto. Como industria, hemos aprendido lo que funciona y lo que no, y para avanzar, necesitamos principios comunes y disciplina que orienten nuestras acciones.

Sin embargo, existe el riesgo de caer en enfoques autoritarios o rígidos, donde las decisiones se imponen desde arriba. Esto es problemático porque algunas ideas pueden estar equivocadas o incompletas, y necesitamos poder cuestionarlas y reemplazarlas por otras mejores.

La solución está en adoptar un enfoque que permita libertad intelectual para desafiar el dogma, distinguir entre modas, malas ideas y buenas ideas, y evolucionar continuamente. Ese enfoque es la ciencia. Y cuando usamos este pensamiento científico para resolver problemas prácticos, lo llamamos ingeniería.

### The Birth of Software Engineering
La ingeniería de software como concepto nació a fines de los años 60. El término fue utilizado por primera vez por Margaret Hamilton, directora de la División de Ingeniería de Software del MIT, quien lideraba el desarrollo del software de control de vuelo para el programa Apollo.

En ese mismo período, la OTAN organizó una conferencia en Alemania (la primera sobre ingeniería de software) para definir el término y abordar lo que entonces se llamó la crisis del software: mientras el hardware progresaba rápidamente, el desarrollo de software se volvía cada vez más complejo y difícil de mantener, generando una gran brecha entre ambos avances.

Los orígenes de esta crisis se remontan a la transición de computadoras programadas manualmente (con *flipping switches* o *hard-coded*) hacia el concepto de *stored program*, que separó claramente software de hardware.

Las ideas discutidas en aquella conferencia han demostrado ser duraderas, y siguen siendo relevantes hoy, lo cual es valioso si buscamos identificar principios fundamentales de la disciplina.

Años después, el Turing Award Fred Brooks, en su famoso artículo “No Silver Bullet” (1986), comparó el desarrollo del software con el del hardware. Destacó que no existía ningún avance, ni técnico ni de gestión, que prometiera una mejora radical en productividad, fiabilidad o simplicidad en software, en contraste con el vertiginoso crecimiento del hardware descrito por la ley de Moore.

Brooks subrayó que el problema no era la lentitud del software, sino la rapidez sin precedentes del hardware, que había experimentado mejoras de seis órdenes de magnitud en 30 años. Esta observación, hecha en los inicios de la era informática, sigue siendo válida hoy: *el software no ha mejorado al mismo ritmo que el hardware*.

### Shifting the Paradigm
El concepto de *cambio de paradigma* fue creado por el físico Thomas Kuhn. Mientras que la mayoría del aprendizaje se construye acumulando capas de conocimiento sobre lo anterior, a veces ocurre un cambio radical de perspectiva que nos obliga a descartar ideas previas para poder aprender cosas nuevas.

Un cambio de paradigma implica necesariamente dejar atrás ideas incorrectas. En este contexto, tratar el desarrollo de software como una verdadera disciplina de ingeniería, basada en el método científico y el racionalismo científico, tiene implicaciones profundas.

Este enfoque no solo mejora la efectividad, como se argumenta en el libro *Accelerate*, sino que exige abandonar ideas anteriores superadas. Permite aprender mejor y desechar más eficientemente las ideas erróneas.

El autor sostiene que la visión del desarrollo de software presentada en este libro representa un cambio de paradigma: *una nueva manera de entender lo que hacemos y cómo lo hacemos.*

## Chapter 2
### What Is Engineering?
El autor comenta que, tras años hablando sobre ingeniería de software, frecuentemente escucha la frase: “Sí, pero la ingeniería de software no es como construir puentes”, como si eso fuera una gran revelación. Y aunque es cierto que no son lo mismo, también es cierto que la idea que muchos desarrolladores tienen sobre la construcción de puentes no refleja la realidad de esa disciplina.

Este malentendido proviene de confundir ingeniería de producción con ingeniería de diseño. La ingeniería de producción, aplicada a objetos físicos, implica desafíos complejos: fabricar con precisión, entregar en un lugar y momento específicos, ajustarse al presupuesto, y adaptar la teoría a la realidad física cuando los modelos fallan.

En cambio, los activos digitales son completamente distintos. Aunque existen algunos paralelismos, los problemas físicos no aplican o se vuelven trivialmente simples. El costo de producción de activos digitales es prácticamente nulo, o al menos debería serlo.

### Production Is Not Our Problem
En la mayoría de las actividades humanas, la producción es la parte difícil. Diseñar un auto, un avión o un celular requiere creatividad, pero llevar ese diseño a producción masiva es mucho más costoso y complejo, especialmente si se quiere hacer con eficiencia.

Como herederos del pensamiento de la era industrial, tendemos —casi sin darnos cuenta— a preocuparnos por la producción como el principal reto de cualquier tarea importante. Esto ha llevado a que, en software, intentemos aplicar un enfoque “industrial” o de “producción en masa”, como es el caso de los procesos *Waterfall*, que imponen líneas de producción al desarrollo de software.

Pero en nuestra disciplina, la producción no es el problema. A menos que tomemos malas decisiones, producir software es simplemente ejecutar un *build*: es automático, escalable, tan barato que debería considerarse gratuito. Y aunque pueden ocurrir errores, estas dificultades están bien comprendidas y cubiertas por herramientas y tecnología.

Este hecho hace que la ingeniería de software sea una disciplina inusual, y también susceptible a malentendidos y prácticas mal aplicadas, ya que la facilidad de producción digital no tiene precedentes en otros campos.

### Design Engineering, Not Production Engineering
En ingeniería, incluso cuando se construye un puente por primera vez, el proceso presenta desafíos particulares. Por un lado, están los problemas físicos y de producción inherentes a la construcción de cualquier estructura tangible, que suelen ser difíciles de cambiar y requieren mucho tiempo para iterar. Por otro lado, el reto principal en construir un nuevo tipo de puente es diseñarlo bien desde el principio, ya que las modificaciones posteriores son muy costosas o casi imposibles. Para enfrentar esta dificultad, los ingenieros de disciplinas físicas usan modelos, maquetas o simulaciones matemáticas para anticipar el comportamiento del diseño antes de construirlo físicamente.

Los desarrolladores de software, en cambio, tienen una ventaja única: *el software mismo es el modelo y el producto final*. A diferencia de un puente o un cohete, *el software se puede cambiar,* probar y validar rápidamente en su entorno real, lo que permite iterar y ajustar mucho más eficientemente.

Sin embargo, a pesar de ser una disciplina técnica, la mayoría del desarrollo de software no sigue plenamente un enfoque racional y científico. Esto se debe en parte a errores históricos y a la percepción de que aplicar ciencia rigurosa es caro y poco práctico en los plazos habituales de desarrollo. También existe una confusión entre ingeniería y matemáticas puras; buscar una precisión matemática ideal no es lo mismo que ingeniería, que es más pragmática y empírica.

En los años 80 y 90, se popularizaron los métodos formales, que intentaban probar matemáticamente que el código era correcto. Aunque atractivos en teoría, estos métodos resultaron poco prácticos para sistemas complejos porque dificultaban la producción de software y no eran adoptados masivamente en la práctica.

La ingeniería de software es diferente a la ingeniería tradicional porque el software es digital, corre en dispositivos determinísticos y puede ser probado y modificado con mucha mayor rapidez que un objeto físico. Por ello, aunque el pensamiento matemático es útil para guiar el diseño, no reemplaza la necesidad de pruebas empíricas y aprendizaje basado en la experiencia real. Esta aproximación pragmática y experimental es la que se asemeja a la forma en que se desarrollan tecnologías aeroespaciales, donde se usan modelos matemáticos para guiar el diseño pero se hacen múltiples prototipos y pruebas físicas, como hace SpaceX con sus cohetes, que continuamente lanza y destruye prototipos para aprender y mejorar.

En software, cuando probamos, estamos evaluando directamente el producto real, no una simple simulación o modelo, lo que nos permite una representación mucho más fiel del comportamiento en producción.

Además, un aspecto importante del verdadero “ingeniero de software” se basa en la experiencia pionera de Margaret Hamilton, quien lideró el desarrollo del software de control para las misiones Apollo. Su trabajo se centró en el error y cómo prevenirlo, adoptando un enfoque racional y científico donde no se esperaba que todo funcionara perfectamente a la primera, sino que se cuestionaban continuamente las suposiciones para descubrir posibles fallos.

Un principio clave que implementaron fue el de *"failing safely"*: dado que no se puede prever cada situación, el software debe estar diseñado para recuperarse de errores y seguir funcionando. Esta capacidad fue vital durante el alunizaje del Apollo 11, cuando el ordenador tuvo alarmas críticas pero pudo reiniciarse y continuar la misión, salvando la operación.

## Chapter 3 
### Fundamentals of an Engineering Approach
Aunque la ingeniería varía según la disciplina —como en la construcción de puentes, aeroespacial, eléctrica o química— todas comparten una base común: están fundamentadas en el racionalismo científico y adoptan un enfoque práctico y empírico para avanzar. Para definir qué es la ingeniería de software, debemos identificar ideas, prácticas y comportamientos duraderos que reflejen la realidad del desarrollo de software y que sean resistentes al cambio.

### An Industry of Change?
En la industria del software hablamos mucho sobre el cambio y la adopción de nuevas tecnologías o productos, pero muchas veces estos cambios no generan mejoras reales o significativas en el desarrollo. Por ejemplo, en una presentación de Christin Gorman se mostró que usar la popular librería *Hibernate* requería incluso más código y era más difícil de entender que escribir directamente en SQL. Esto ilustra que algunas novedades pueden hacer las cosas más complicadas en lugar de facilitar el trabajo.

El sector del software parece tener dificultades para aprender y avanzar realmente, aunque esto se oculta gracias al gran progreso en el hardware donde se ejecuta el software. No se niega que haya avances en software, pero el ritmo es mucho más lento de lo que se cree.

Si pensamos en nuestra propia experiencia profesional, pocas ideas realmente han transformado nuestra manera de pensar y trabajar en software. Por ejemplo, David ha usado muchas lenguajes de programación, pero solo dos cambios paradigmáticos tuvieron un gran impacto: pasar del lenguaje ensamblador a C, y el cambio de programación procedural a programación orientada a objetos. Estas transiciones aumentaron el nivel de abstracción y la complejidad de los sistemas que se podían construir.

Aunque Fred Brooks afirmó que no hay avances de orden de magnitud en software, sí hay grandes pérdidas y retrocesos causados por tecnologías o procesos inadecuados. 

Además, la industria tiene dificultades no solo para aprender nuevas ideas, sino también para abandonar las viejas, incluso cuando ya han sido desacreditadas o no sirven. Esto ralentiza el progreso real y la innovación en el desarrollo de software.

### The Importance of Measurement
Nos cuesta mucho desechar ideas malas porque no medimos bien nuestro desempeño en desarrollo de software. Muchas métricas comunes, como la velocidad o las líneas de código, son irrelevantes o incluso perjudiciales. En desarrollo ágil se ha pensado que no se puede medir el *throughput* de los equipos de software, pero eso no significa que no se pueda medir nada útil.

Investigaciones recientes, como las de Fosgren, Humble y Kim en “Accelerate”, muestran un avance importante. En lugar de medir productividad, ellos evalúan la efectividad del equipo con dos atributos clave: *stability* y *throughput*. *Estas medidas no prueban causalidad, pero sí correlación estadística con el desempeño.*

La *stability* se mide por la tasa de fallos tras cambios y el tiempo de recuperación de fallos, reflejando la calidad del trabajo. El *throughput* se mide por el tiempo que tarda una idea en convertirse en software funcionando y la frecuencia con que se despliegan cambios, reflejando la eficiencia.

Los equipos que tienen alta *stability* y alto *throughput* suelen compartir prácticas comunes como automatización de pruebas, desarrollo basado en la rama principal y entrega continua. Además, estas organizaciones con equipos de alto desempeño suelen obtener mejores resultados comerciales.

Finalmente, el estudio demuestra que no hay que elegir entre velocidad o calidad: ambos van de la mano y dependen de un buen feedback y excelente ingeniería.

### Applying Stability and Throughput
Es importante que estas medidas (*stability* y *throughput*) estén correlacionadas con buenos resultados, porque así podemos usarlas para evaluar cambios en procesos, organización, cultura o tecnología.

Por ejemplo, si queremos mejorar la calidad del software, podríamos agregar un cambio como una junta de aprobación (CAB). Aunque parece lógico que más revisiones mejoren la calidad, los datos muestran que estas juntas no mejoran la *stability*, sino que ralentizan el proceso y empeoran el desempeño general.

Esto demuestra que sin medición efectiva solo hacemos suposiciones. Para tomar decisiones basadas en evidencia, debemos medir cómo afectan los cambios nuestro *throughput* y *stability*, en lugar de fiarnos solo de opiniones.

Este modelo de *stability* y *throughput* nos da una herramienta útil para medir el impacto de cualquier cambio en nuestro trabajo, ya sea un nuevo lenguaje, más automatización, o ajustes en la cultura. Aunque haya que interpretar con cuidado los resultados, disponer de métricas significativas es fundamental para mejorar con base científica y no a ciegas.


### The Foundations of a Software Engineering Discipline
Las ideas fundamentales que seguirán siendo válidas en el futuro, sin importar la tecnología o el problema, se dividen en dos áreas: enfoque filosófico/procesos y técnicas/diseño.

Primero, nuestra disciplina debe centrarse en dos competencias clave:* aprender de forma experta y aceptar que el desarrollo de software es una disciplina creativa de diseño, no una ingeniería de producción tradicional.* Por eso, debemos dominar la exploración, el descubrimiento y el aprendizaje continuo, aplicando un razonamiento científico.

Segundo, necesitamos mejorar nuestras habilidades para *manejar la complejidad*, porque construimos sistemas grandes y complicados, con muchos participantes. Esto implica gestionar esa complejidad tanto en lo técnico como en lo organizacional para poder trabajar eficazmente.


### Experts at Learning
*La ciencia es la mejor forma que tiene la humanidad para resolver problemas.* Para convertirnos en expertos en aprendizaje, debemos adoptar un enfoque científico práctico, adaptado a los problemas específicos del software, similar a cómo otras ramas de la ingeniería tienen sus métodos propios.

Aunque estas ideas son conocidas, no siempre se aplican como base en el desarrollo de software. Hay cinco comportamientos clave que definen este enfoque:

* Trabajar de forma iterativa
* Recibir retroalimentación rápida y de calidad
* Trabajar de manera incremental
* Ser experimental
* Ser empírico

Estos comportamientos pueden parecer abstractos, pero son fundamentales porque el desarrollo de software es un proceso de exploración y descubrimiento constante. Siempre estamos aprendiendo sobre lo que los usuarios necesitan, cómo resolver mejor los problemas y cómo usar las herramientas disponibles.

Este aprendizaje continuo es la base de nuestro trabajo y explica por qué enfoques tradicionales como el modelo waterfall no funcionan tan bien hoy en día. En cambio, estas prácticas están vinculadas con equipos de alto *throughput* y éxito sostenido.

### Experts at Managing Complexity
Como desarrolladores de software, vemos muchas fallas en el desarrollo y en la cultura del sector que se pueden entender mejor con dos conceptos clave de la ciencia de la información: *concurrency* y *coupling*. Estos no son problemas exclusivos del software; también afectan a las organizaciones porque una organización humana es, en esencia, un sistema de información muy complejo.

Cuando construimos sistemas complejos, no solo debemos manejar la complejidad técnica del software, sino también la complejidad organizacional. Muchas veces no se presta suficiente atención a esto, y por eso terminamos con sistemas desordenados, mucha deuda técnica, muchos errores y organizaciones que temen cambiar sus sistemas.

Para enfrentar problemas complejos hay que dividirlos para no abrumarse. Esta división depende del problema, la tecnología y hasta de nuestras capacidades, aunque tendemos a sobreestimar cuánto podemos controlar la complejidad. Por eso es importante partir de la idea de que probablemente nos equivocamos y manejar la complejidad con cuidado.

Hay cinco ideas clave para gestionar la complejidad de forma estructurada, que están vinculadas a aprender bien y son: *modularity*, *cohesion*, *separation of concerns*,*information hidding / abstraction* y *coupling*.
