# The Early History of Smalltalk — Alan C. Kay

> Resumen de estudio estructurado por sección del texto original.
> Foco: la historia de Smalltalk, las ideas y tecnologías que lo influyeron, y la
> filosofía de diseño de Alan Kay. Las cajas **"💡 Nota técnica"** explican
> tecnologías de la época que hoy pueden resultar desconocidas.

El paper fue escrito por Alan Kay (en ese momento en Apple) para la conferencia *History of Programming Languages II* (HOPL-II, 1993). La sesión la presidió Barbara Ryder y la comentó **Adele Goldberg**, una de las figuras centrales de Smalltalk.

---

## Idea central (para tener en la cabeza todo el tiempo)

Smalltalk nace de una intuición: **todo lo que podemos describir se puede representar por la composición recursiva de un único tipo de "bloque de construcción de comportamiento"**, que esconde dentro de sí mismo su combinación de *estado* y *proceso*, y con el que solo se puede interactuar mediante el **intercambio de mensajes**.

Tres metáforas que Kay repite:

- **Filosófica**: los objetos se parecen a las *mónadas* de Leibniz (entidades cerradas que solo se comunican) y a las *Ideas* de Platón (algunos objetos son idealizaciones —clases— de las que se crean manifestaciones —instancias—). El sistema es completamente autodescriptivo: las clases también son objetos.
- **Biológica**: un objeto es como una **célula** protegida por su membrana, que solo se comunica por mensajes. Un sistema es como "miles y miles de computadoras conectadas por una red muy rápida".
- **Informática**: Smalltalk es una **recursión sobre la noción misma de computadora**. En vez de dividir la computadora en cosas más débiles (estructuras de datos, procedimientos, funciones), cada objeto es una recursión de toda la capacidad de la computadora.

Frase de **Bob Barton** que es el germen de todo: *"El principio básico del diseño recursivo es hacer que las partes tengan el mismo poder que el todo."*

---

## Introducción

Kay escribe la intro en un avión, usando una notebook de 1992 (su "Dynabook provisorio"): pantalla bitmap de alta resolución, ventanas superpuestas, íconos, dispositivo apuntador, networking, software orientado a objetos. Es —dice— bastante parecido a lo que tenía en mente a fines de los sesenta.

Puntos clave de la introducción:

- Smalltalk fue parte de una búsqueda más grande que Kay llamó **personal computing**, dentro de ARPA y luego de Xerox PARC. La atribución de crédito de las ideas es prácticamente imposible: cita a Goethe ("compartir la emoción del descubrimiento sin intentos vanos de reclamar prioridad").
- Distingue dos tipos de lenguajes: los de **"aglutinación de features"** (COBOL, PL/1, Ada — hechos por comités) y los de **"cristalización de un estilo"** (LISP, APL, Smalltalk — hechos por una sola persona).
- Kay se reconoce **instigador y diseñador original**, pero insiste en que Smalltalk pertenece más a quienes lo hicieron funcionar, **especialmente Dan Ingalls y Adele Goldberg**. Dan fue la figura central de la implementación.
- El foco del paper está en los eventos que llevaron a **Smalltalk-72** y su transición a **Smalltalk-76**, porque ahí ocurrieron la mayoría de las ideas.

> 💡 **Nota técnica — ARPA / ARPA-IPTO**
> ARPA (hoy DARPA) era la agencia de investigación del Departamento de Defensa de EEUU. Su oficina IPTO (Information Processing Techniques Office) financió en los 60 casi toda la investigación avanzada en computación de EEUU. Su filosofía: **financiar personas y direcciones, no proyectos y metas concretas**. De ahí salieron el tiempo compartido (time-sharing), los gráficos interactivos, las redes y la idea de "simbiosis hombre-máquina" de J.C.R. Licklider. El ARPANet financiado por ahí terminó siendo Internet.

---

## 11.1 — 1960-1966: Primeras ideas de OOP y el clima de los sesenta

Kay dice que OOP vino de muchas motivaciones, pero dos centrales:

1. **A gran escala**: encontrar un mejor esquema de **módulos** para sistemas complejos, que oculten detalles internos (*information hiding*).
2. **A pequeña escala**: encontrar una versión más flexible de la **asignación** (`:=`), y eventualmente eliminarla.

Kay describe cómo las ideas nuevas pasan por etapas: primero "apenas las ves", luego las notás sin entender su importancia, después las usás operativamente, luego viene una "gran rotación" en la que el patrón se vuelve el centro de un nuevo modo de pensar, y finalmente se vuelve una religión inflexible. (Cita a Schopenhauer: una idea nueva primero se denuncia como locura, luego se considera obvia, y al final los que la denunciaron dicen haberla inventado.)

**Las primeras veces que Kay "apenas vio" la idea (≈1961, programador en la Fuerza Aérea):**

- **El sistema de archivos del Burroughs 220 (USAF ATC)**: un diseñador anónimo dividió cada archivo en tres partes — (3) los datos reales, (2) los **procedimientos** que saben cómo acceder y actualizar esos datos, y (1) un arreglo de **punteros a los puntos de entrada de esos procedimientos**. Es decir: los datos venían empaquetados con el código que sabía operarlos, accesible solo a través de una interfaz de punteros. Esto es, en embrión, **encapsulamiento e independencia de representación**. Murió cuando se impuso COBOL.

- **El Burroughs B5000**: Kay tomó nota de su memoria segmentada, su ejecución por *byte-codes*, el cambio automático de subrutinas y multiproceso, el código puro reentrante (compartible), y sus mecanismos de protección. Vio que el acceso vía la **Program Reference Table (PRT)** se parecía al esquema del 220 (interfaz procedural a un módulo).

Después de la Fuerza Aérea trabajó programando sistemas de recuperación de datos meteorológicos. Se interesó por la **simulación** (de una máquina por otra). En 1965, en Chippewa Falls junto a la CDC 6600, leyó un artículo de **Gordon Moore** prediciendo el crecimiento exponencial de los chips de silicio (la futura "Ley de Moore"). En ese momento no le pareció relevante.

> 💡 **Nota técnica — Burroughs B5000 (1961)**
> Mainframe revolucionario diseñado por **Bob Barton**. Adelantado décadas: usaba **byte-codes** (instrucciones compactas interpretadas), **memoria virtual segmentada**, hardware diseñado para compilar lenguajes de alto nivel (ALGOL), **descriptors** (referencias seguras a datos/arreglos/procedimientos con protección tipo "capability"), una **PRT** (tabla con semántica uniforme de nombres) y corrutinas automáticas. Casi nada de esto era común en otras máquinas, que se programaban en assembler crudo. El B5000 fue una fuente conceptual enorme para Smalltalk (referencias de objeto seguras, byte-codes, protección).

> 💡 **Nota técnica — Ley de Moore**
> Observación de Gordon Moore (1965) de que la cantidad de componentes por chip (y la potencia/costo) mejora exponencialmente con el tiempo. Para Kay fue la justificación de que la computación personal era inevitable: lo que en 1968 era una máquina del tamaño de una habitación, en los 80 cabría en un escritorio.

### 11.1.1 Sketchpad y Simula — "el gran impacto"

Kay llega a la Universidad de Utah (1966) "sin saber nada". El objetivo de Utah dentro de ARPA era resolver el problema de la *hidden line* (líneas ocultas) en gráficos 3D. Dave Evans le da dos cosas para leer/arreglar:

- **Sketchpad** (tesis de Ivan Sutherland, 1963): le voló la cabeza. Tres grandes ideas accesibles:
  1. Fue la invención de los **gráficos interactivos modernos**.
  2. Las cosas se describían haciendo un **"dibujo maestro" (master)** que producía **"dibujos instancia" (instances)** — anticipa clases e instancias.
  3. El control y la dinámica venían de **restricciones (constraints)** gráficas aplicadas a los masters.
  Además fue el primero con ventanas de *clipping* y *zoom*.

- **Simula** (le pasan el "ALGOL del 1108" que en realidad era Simula, mal documentado, traducido del noruego): junto a otro estudiante desplegó el listado del programa 80 pies por el pasillo y lo recorrió gateando. La parte rara era el **asignador de almacenamiento, que no obedecía una disciplina de pila (stack)** como ALGOL. La revelación: Simula estaba **asignando estructuras parecidas a las instancias de Sketchpad**. Lo que Sketchpad llamaba masters e instances, Simula lo llamaba **activities y processes**. Y Simula era un **lenguaje procedural** para controlar esos objetos, con más flexibilidad que las restricciones de Sketchpad.

Este fue **el gran impacto** ("the big hit, and I have not been the same since"). Kay conectó esto con su formación: álgebra abstracta (pocas operaciones que aplican a muchas estructuras) y biología (mecanismos simples controlando procesos complejos; una célula que se diferencia en todos los tipos de células). El sistema de archivos del 220, el B5000, Sketchpad y Simula usaban **la misma idea para propósitos distintos**.

Acá aterriza la frase de **Bob Barton** (diseñador del B5000 y profesor en Utah): *"hacer que las partes tengan el mismo poder que el todo"*. Kay pensó por primera vez en el **todo como la computadora entera**, y se preguntó por qué dividirla en cosas más débiles (datos y procedimientos). ¿Por qué no dividirla en **muchas computadoras chiquitas**, no docenas sino miles, cada una simulando una estructura útil?

> 💡 **Nota técnica — Sketchpad (Ivan Sutherland, 1963)**
> El primer programa de gráficos interactivos de la historia, corría en la TX-2 del Lincoln Lab. Se dibujaba con un lápiz óptico sobre la pantalla. Introdujo masters/instances, restricciones geométricas, y ventanas con clipping y zoom. Sutherland: *"No sabía que era difícil."*

> 💡 **Nota técnica — Simula (Nygaard y Dahl, Noruega)**
> Simula I (1965) y Simula 67 eran extensiones de ALGOL pensadas para **simulación de sistemas**. Introdujeron las **clases** (descripciones que generan múltiples instancias con estado propio y su propio "program counter"), y Simula 67 agregó la **herencia**. Es el ancestro directo más importante de la OOP. A diferencia de ALGOL, sus objetos no vivían en una pila sino en el heap, persistiendo de forma independiente.

> 💡 **Nota técnica — pila (stack) vs. heap**
> Los lenguajes tipo ALGOL gestionan la memoria con una **pila**: cuando una función termina, su espacio se libera automáticamente. Los objetos de Simula/Smalltalk necesitan vivir más tiempo que la función que los crea, así que se asignan en el **heap** y requieren gestión de memoria (eventualmente *garbage collection*). Que Simula no usara la pila fue justamente la pista que reveló a Kay que estaba haciendo algo distinto.

---

## 11.2 — 1967-1969: La máquina FLEX, primer intento de PC basada en OOP

Dave Evans (que no creía mucho en el doctorado como institución y conseguía consultorías para sus alumnos) presenta a Kay con **Ed Cheadle**, un ingeniero de hardware que estaba haciendo una "maquinita" para profesionales no-informáticos. Querían programarla en un lenguaje de alto nivel (Cheadle pensaba en BASIC; Kay propuso **JOSS**, "es más lindo"). Así nace la colaboración: la **máquina FLEX**.

- La máquina era muy chica (máximo 16K palabras de 16 bits) → Simula no entraba.
- **JOSS** era hermoso por su atención al usuario final, pero lento y sin procedimientos reales ni alcance de variables.
- Adoptaron ideas de **EULER** (de Wirth), una generalización de ALGOL donde se descartaban los tipos, los procedimientos eran objetos de primera clase, y se compilaba a byte-codes tipo B5000. Esto sugería que la maquinita de Ed podía correr byte-codes emulados en microcódigo.

**Decisiones de diseño importantes de FLEX:**

- **Referencias a objetos** como generalización de los *descriptors* del B5000: un descriptor de FLEX tenía dos punteros, uno al **master** del objeto y otro a la **instancia**.
- **Asignación generalizada**: Kay se dio cuenta de que `:=` **no debía ser un operador**, sino una especie de índice que selecciona un comportamiento del objeto. Es decir, `a[55] := 0` debía verse como `a(55, ':=', 0)`, dejando que el objeto decida qué hacer. Conclusión profunda que le costó ver: *"los objetos son una especie de mapeo cuyos valores son sus comportamientos"*. (Un libro de lógica de **Carnap** sobre definiciones "intensionales" lo ayudó.)
- Corrutinas (de Conway) para suspender y reanudar objetos.
- Una estructura de control `when` (interrupción "blanda" dirigida por eventos), compilada en un árbol que cacheaba resultados parciales — muy parecido a cómo funcionan hoy las **hojas de cálculo**.

### 11.2.1 Doug Engelbart y NLS

En 1967 Engelbart visita Utah. Es descrito como "un profeta de dimensiones bíblicas". Su sistema **NLS** (oN-Line System) buscaba la **"augmentación del intelecto humano"**: hipertexto, gráficos, múltiples paneles, navegación eficiente, **trabajo colaborativo interactivo**. El impacto fue una metáfora convincente de cómo debía ser la computación interactiva.

En este contexto, con la Ley de Moore en la cabeza, Kay hace **el salto**: imaginar la TX-2 (del tamaño de una habitación) o una 6600 puesta sobre un escritorio. Razonamiento: en vez de unos pocos miles de mainframes institucionales y usuarios entrenados, habría **millones de máquinas y usuarios personales**, fuera del control institucional. Por lo tanto, el sistema tenía que ser **extensible** y los propios usuarios finales tendrían que hacer la mayor parte del *tailoring* de sus herramientas.

Crítica de Kay a NLS: su interfaz parametrizable forzaba al usuario a estar en un **estado** del que había que salir antes de hacer otra cosa (menús jerárquicos con backtracking). Lo que hacía falta era una interfaz más **"plana"**, con una flecha de transición desde cada estado a cualquier otro. Decidió que la idea de **ventana general** de Sketchpad (que ve un mundo virtual más grande) era mejor que los paneles horizontales restringidos.

> 💡 **Nota técnica — NLS y "The Mother of All Demos"**
> NLS, de Douglas Engelbart (SRI), se presentó en la famosa demo de 1968 que mostró por primera vez el **mouse** (que Engelbart coinventó), hipertexto, edición de texto en pantalla, videoconferencia y trabajo colaborativo. Fundó prácticamente toda la interacción moderna.

> 💡 **Nota técnica — JOSS**
> Sistema interactivo de tiempo compartido de RAND (años 60), célebre por su atención al usuario final y su elegancia en la interacción. Kay lo cita como un estándar de estética de interacción "no superado".

> 💡 **Nota técnica — LINC (Wes Clark, 1962)**
> Considerada la primera computadora personal real (anterior a FLEX). Pequeña, pensada para un único usuario (laboratorios de ciencias de la vida).

### Más influencias de 1968-1969 (camino al Dynabook)

- En la reunión de estudiantes de ARPA, **John Warnock** (futuro fundador de Adobe) propuso que ARPA hiciera reuniones anuales de estudiantes.
- **Marvin Minsky** y las ideas de **Piaget y Papert** sobre educación: replantear el aprendizaje a la luz de la psicología cognitiva del siglo XX. La computación entra como **un nuevo sistema de representación** con metáforas útiles para manejar la complejidad.
- Kay ve el **primer display de panel plano** (de plasma, en la Universidad de Illinois) y calcula —vía Moore— que el silicio de FLEX cabría detrás de un display a fines de los 70 o principios de los 80.
- En RAND ve **GRAIL**, sucesor gráfico de JOSS, con la **RAND tablet** (primera tableta) y reconocimiento de gestos. Era **manipulación directa, analógico, sin modos (modeless), hermoso**. Kay se da cuenta de que la interfaz de FLEX estaba toda mal.
- Visita a **Seymour Papert** y a quienes hacían **LOGO** con chicos en escuelas: los chicos programaban de verdad. Acá llega el insight definitivo: la computación personal no iba a ser un *vehículo* dinámico personal (metáfora de Engelbart), sino un **medio dinámico personal** ("personal dynamic medium"). Y como medio, tenía que extenderse al mundo de la infancia.

**Nace la imagen del Dynabook**: del tamaño de un cuaderno (recordando a Aldus Manutius, que hizo que el libro entrara en las alforjas), con una interfaz tan amigable como JOSS/GRAIL/LOGO pero con el alcance de Simula/FLEX. Kay construyó un **modelo de cartón con perdigones de plomo** para sentir el peso (menos de 2 kg), con teclado y stylus, y networking inalámbrico (porque ARPA empezaba con packet radio).

**Conferencia de Lenguajes Extensibles (1969)**: una "guerra religiosa de ideas mal pensadas y no implementadas" (cita irónica de Alan Perlis). El único que había hecho algo real era **Ned Irons con IMP**: cualquier frase de la gramática podía usarse como cabecera de procedimiento, con definición semántica en términos del lenguaje extendido hasta ese punto. Kay incorporó la idea: que **cada objeto sea un intérprete dirigido por sintaxis de los mensajes que se le envían**. De un golpe, esto unificaba la semántica orientada a objetos con un lenguaje completamente extensible. Imagen mental: **computadoras separadas mandándose pedidos** que deben ser aceptados y entendidos por el receptor; cada objeto es un **servidor** que ofrece servicios según su relación con el "servido".

### El año en Stanford (post-tesis) y entender LISP

Tras su tesis (*The Reactive Engine*, 1969), Kay va al Stanford AI Lab y piensa más en "KiddyKomputers" que en IA. Dos diseños de IA lo influyen:

- **PLANNER** de Carl Hewitt (base de SHRDLU de Winograd).
- El sistema de **formación de conceptos de Pat Winston**: redes semánticas donde los arcos (atributos) también se modelaban como redes; base de los *frames* de Minsky.
- **CAL-TSS** (Butler Lampson): un sistema operativo basado en **capabilities** que parecía muy "orientado a objetos" (punteros infalsificables con bit-masks que restringían acceso). Confirmó su metáfora de "objetos como servidores". El "problema" (que los diseñadores no veían como problema): solo ciertas cosas grandes eran "objetos"; las cosas chicas y rápidas no. **Eso había que arreglarlo: que TODO sea objeto.**

**Entender LISP de verdad** fue el mayor impacto en Stanford. Kay admiró la belleza de `eval` y `apply`, pero notó **fallas en sus fundamentos lógicos**: el lenguaje supuestamente se basaba en funciones, pero sus componentes más importantes (lambda, quote, cond) no eran funciones sino **"formas especiales"** (special forms). En el lenguaje práctico existían **EXPRS** (evalúan sus argumentos) y **FEXPRS** (no los evalúan). Pregunta clave de Kay: ¿por qué llamarlo "lenguaje funcional"? ¿Por qué no basar todo en FEXPRS y forzar la evaluación en el lado receptor cuando haga falta? Esto disparó la línea de pensamiento: **"tomá lo más difícil y profundo que necesitás hacer, hacelo genial, y construí todo lo más fácil a partir de eso"**. La promesa de LISP era lambda; Kay necesitaba algo "más difícil y profundo": **los objetos debían serlo**.

> 💡 **Nota técnica — LISP (McCarthy, 1960)**
> Para Kay, "el diseño individual más grande de un lenguaje". Su característica clave: el **intérprete de LISP está escrito en sí mismo** (metacircular), en aproximadamente una página de código. Esto fue justamente lo que después Kay tomó como desafío para Smalltalk ("definir el lenguaje más poderoso del mundo en una página"). LISP también introdujo el código como estructura de datos y la evaluación respecto de entornos arbitrarios.

> 💡 **Nota técnica — capabilities (CAL-TSS, GENIE)**
> En seguridad de sistemas operativos, una *capability* es una referencia infalsificable que otorga ciertos derechos sobre un recurso. Kay vio en esto un modelo de protección de objetos: no alcanza con verificar tipos, hay que **proteger todos los objetos** y restringir lo que se puede hacer con cada uno. De ahí su lema posterior: *"hacelos a todos ciudadanos de primera clase y protegelos a todos"*.

---

## 11.3 — 1970-1972: Xerox PARC — KiddiKomp, MiniCom y Smalltalk-71

En julio de 1970 Xerox crea **PARC** (Palo Alto Research Center). **Bob Taylor** (ex ARPA) arma el Computer Science Laboratory. Razón del traslado de talento: la **Enmienda Mansfield** amenazaba con redirigir el financiamiento de ARPA hacia investigación militar directa. Kay empieza a consultar; Taylor le dice "seguí tus instintos".

Kay retoma la idea de la KiddiKomp:

- Recuerda otra frase de Barton: *"las buenas ideas no suelen escalar"*. El B5000 no escalaba a una máquina chica; solo los byte-codes lo hacían (con modificaciones). Vuelve a mirar la **LINC** de Wes Clark.
- Diseña un lenguaje llamado **SLOGO** ("Simulation LOGO"), pensado para un SONY "tummy trinitron" con display bitmap.
- Se inspira en el **LISP para PDP-1 de Peter Deutsch** (implementado a los 15 años, en solo 2K).
- Insight de Papert: no hace falta hacer mucho para que una computadora sea un "objeto para pensar" para los chicos, pero lo que se haga tiene que estar bien hecho y aplicarse en profundidad.

En enero de 1971, Taylor atrae a PARC a gran parte de la **Berkeley Computer Corp.**: Butler Lampson, Chuck Thacker, Peter Deutsch, Jim Mitchell, entre otros. También llega gente de Engelbart (incluido **Bill English**, coinventor del mouse). Conflicto con Xerox: el grupo quería una PDP-10 (de DEC, competidor) → terminaron construyendo su propia emulación, la **MAXC**, que por primera vez usó chips de memoria integrada (¡1K bits!) en vez de núcleos de ferrita.

**Anécdota de la "belleza de LISP"**: Allen Newell visita PARC con su teoría del pensamiento jerárquico. Le dan un problema (dada una lista, producir los elementos de índice impar seguidos de los pares). Newell, usando su lenguaje tipo IPL-V (con punteros explícitos), batalla más de 30 minutos. Kay lo escribe en LISP en segundos:
```
oddsEvens(x) = append(odds(x), evens(x))
```
Lección: *"el punto de vista vale 80 puntos de IQ"*. No era más inteligente, tenía mejor herramienta mental.

**Conflicto con Don Pendery** (el "planificador" de Xerox que solo quería "tendencias" y cómo "defenderse del futuro"): Kay le contesta con su frase famosa: **"La mejor manera de predecir el futuro es inventarlo."** De ahí salieron los "Pendery Papers".

Kay arma su grupo, el **Learning Research Group (LRG)** — nombre deliberadamente vago. Contrataba solo gente "a la que se le iluminaban los ojos" con la idea de la notebook. Cuando alguien no sabía qué hacer, señalaba el modelo de cartón y decía: *"Avanzá eso."* (Cita de Dan Ingalls: el grupo se desarrolló "a través del amor y la energía de todo el Learning Research Group".)

### Smalltalk-71

En el verano del 71, Kay refina la KiddiKomp en un diseño llamado **miniCOM** (enfoque bit-slice tipo NOVA 1200, display bitmap, dispositivo apuntador) y un lenguaje que **ahora llama "Smalltalk"** — como en "programar debería ser una cuestión de *small talk* (charla)" y "los chicos deberían programar en...". El nombre era a propósito modesto, en reacción a los sistemas con nombres de dioses (Zeus, Odin, Thor) que "no hacían nada".

**Smalltalk-71** estaba muy influido por FLEX, PLANNER, LOGO y META II. Era una especie de **parser con object-attachment que ejecutaba tokens directamente** (pattern matching). El almacenamiento de programas se ordenaba en una red de discriminación. Kay quería un esquema claro que manejara varios estilos de programación, no tanto patrones algebraicos.

Ejemplos de Smalltalk-71 (figura 11.23) mostraban definiciones tipo:
```
to 'factorial' 0 is 1
to 'factorial' :n do 'n*factorial n-1'
to :e 'is-member-of :group
    do 'if e = first of group then T
        else e is-member-of rest of group'
```

Kay seguía molesto con que LISP necesitara "formas especiales". Quería **control total sobre lo que se pasa en un envío de mensaje**: específicamente, **cuándo y en qué entorno** se evalúan las expresiones.

> 💡 **Nota técnica — META II (Schorre, 1963)**
> Un "compiler-compiler": un lenguaje para escribir compiladores definiendo gramáticas. De ahí venían las "raras convenciones de comillas" de Smalltalk-71.

> 💡 **Nota técnica — bitmap display**
> Pantalla donde cada píxel está mapeado a un bit (o varios) en memoria, permitiendo dibujar gráficos arbitrarios y texto con tipografías variables. Antes lo común eran las "glass teletypes" (terminales que solo mostraban caracteres fijos). El bitmap es la base de toda interfaz gráfica moderna.

### Tesis de Dave Fisher y "diseño reflexivo"

La tesis de **Dave Fisher** (CMU, 1970) sobre síntesis de estructuras de control influyó mucho: mostró cómo generalizar los enlaces de ALGOL-60 (dinámico para subrutinas, estático para estado global) para simular muchísimas estructuras de control. Esto anticipa lo que hoy se llama **diseño reflexivo** y la **evaluación perezosa (lazy evaluation)**.

La conclusión de Kay: para "hacer LISP bien" o "hacer OOP bien" alcanzaba con manejar la mecánica de las **invocaciones entre módulos** sin preocuparse por los detalles internos de los módulos. La diferencia entre LISP y OOP sería solo **qué pueden contener los módulos**. Hacía falta una **referencia universal de objeto** (à la B5000/LISP) y una **estructura portadora de mensajes**. Kay enumera los campos de esa estructura "messenger" (generalización de un stack frame): GLOBAL, SENDER, RECEIVER, REPLY-STYLE, STATUS, REPLY, OPERATION SELECTOR, # de parámetros, P1...PN.

Reflexión sobre la belleza: la belleza de la matemática viene de la sinergia entre **parsimonia, generalidad, esclarecimiento y finura** (ej.: el teorema de Pitágoras). Un buen sistema necesita "alta pendiente": buena relación entre lo interesante que es y la complejidad necesaria para expresarlo. Su metáfora estética favorita: el **óvulo fertilizado** que se transforma en un organismo complejo — elegancia y practicidad a la vez, como la membrana celular que presenta una interfaz uniforme al mundo.

**El insight de las ventanas superpuestas**: a Kay le preocupaba el tamaño del display bitmap. En la ducha (su lugar favorito para pensar) se le ocurre que las ventanas tipo FLEX podían aparecer como **documentos superpuestos en un escritorio**, donde la que se refresca sube al tope de la pila. No le pareció genial al principio, pero magnificaba el área efectiva de la pantalla.

**El hardware de soporte**: Bill English y Butler Lampson especifican un generador de caracteres experimental (construido por Roger Bates) para las terminales POLOS. Gary Starkweather había hecho funcionar la **primera impresora láser** ("SLOT machine", 500 píxeles por pulgada). Ben Laws hizo un editor de fuentes y aprendieron sobre las peculiaridades (no lineales) del sistema visual humano.

> 💡 **Nota técnica — NOVA**
> Minicomputadora de Data General (años 60-70). El "10 times faster NOVA" fue uno de los objetivos del ALTO.

> 💡 **Nota técnica — microcódigo / emulación**
> Las instrucciones de byte-code de Smalltalk no corrían directamente en el hardware: un programa de **microcódigo** (más cercano al hardware) las interpretaba/emulaba. Permitía implementar funciones de alto nivel sin hardware dedicado. Butler Lampson sugirió un esquema de "Huffman pobre": mapear distintos significados a distintas partes del espacio de 256 valores de un byte. Todos los emuladores de PARC lo usaron.

### Tensión con Piaget/Bruner y giro hacia lo icónico

Tras leer a **Piaget y Bruner**, Kay se preocupa de que el enfoque puramente simbólico (FLEX, LOGO, Smalltalk) sea difícil para los chicos, porque la etapa simbólica recién se estaba "encendiendo". Educadores admirados (Montessori, Holt, Suzuki) pedían un enfoque más **figurativo/icónico**. GRAIL no servía (usaba imágenes para flowcharts), pero **AMBIT-G** de Rovner (una especie de SNOBOL visual) prometía. Plan de Kay para los años siguientes: un sistema real con OOP, ventanas, pintura, música, animación y **"programación icónica"**.

Lema que aparece en esta sección: **"Las cosas simples deberían ser simples, las cosas complejas deberían ser posibles."**

---

## 11.4 — 1972-1976: El primer Smalltalk real (-72), nacimiento, aplicaciones y mejoras

Dos "apuestas" cambian todo en septiembre de 1972:

**Apuesta 1 — el hardware:** Butler Lampson y Chuck Thacker le preguntan a Kay si tiene plata (tenía ~$230K para NOVAs y generadores de caracteres). Se ofrecen a construirle su "maquinita": Butler quería un "PDP-10 de $500", Chuck quería una "NOVA 10 veces más rápida", y Kay quería una "kiddicomp". Chuck había apostado que hacía la máquina entera en tres meses. Nace el **ALTO** (el "Interim Dynabook").

**Apuesta 2 — el lenguaje:** En una charla de pasillo, Ted Kaehler y Dan Ingalls preguntan cuán grande tendría que ser un lenguaje para tener gran poder. Kay, con bravuconería, afirma que se podía definir **"el lenguaje más poderoso del mundo en una página de código"**. Le dicen "poné lo que prometés o callate". Durante dos semanas Kay llegaba a PARC a las 4 de la mañana. La base de la apuesta era el intérprete metacircular de LISP de McCarthy.

Fue más difícil de lo esperado por tres razones: (1) quería un intérprete no-recursivo tipo el segundo de McCarthy (más "real"); (2) el entrelazado del "parseo" con la recepción de mensajes obligaba al intérprete a reentrar mucho antes que LISP; (3) no tenía claro cómo debían funcionar `send` y `receive`. Igual logró una versión que funcionaba. Pocos días después, **Dan Ingalls la mostró corriendo en la NOVA** (¡codificada en BASIC!), con scanner de tokens, etc. Frase de Dan: *"Lo hacés y ya está."* Evaluaba `3+4` **muy lentamente** ("glacial", según Butler), pero el resultado siempre era 7.

Esto fue **Smalltalk-72**. Dan, a lo largo de 10 años, hizo al menos 80 releases mayores. En noviembre Kay presentó las ideas en el MIT AI Lab, lo que llevó al modelo de **Actores** de Carl Hewitt (muy parecido a Smalltalk en su primer paper; después los caminos divergieron).

**El ALTO ("Bilbo")**: Chuck Thacker empezó el 22/11/1972 y en abril de 1973 estaba listo. Display de ~500.000 píxeles (606×808), ~6 MIPS, 96 KB, todo en 160 chips MSI en dos placas. Característica genial: **tasking de "overhead cero"** con 16 program counters (uno por tarea), arquitectura de corrutinas. La primera imagen en pantalla fue el **Cookie Monster** de los Muppets. Pronto Dan portó Smalltalk al ALTO. Se construyeron unos 2000 ALTOs en total.

**Conflictos con Xerox y el artículo de Rolling Stone**: el ejecutivo "X" se opuso a construir más miniCOMs ("usaron demasiados sellos verdes con la MAXC"). Un artículo de Stewart Brand en *Rolling Stone* (1972) sobre PARC y la comunidad hacker causó furor en la central de Xerox: obligaron a usar credenciales y restringieron las publicaciones — desastroso para el LRG, que necesitaba compartir ideas. Irónicamente (cumpliendo a Schopenhauer), "X" después decidió que el ALTO era una gran idea y quiso quedarse con casi todos.

### Las 6 ideas principales de Smalltalk-72

(Figura 11.29 — las primeras 3 son "objetos vistos desde afuera", no cambiaron nunca; las últimas 3 son "desde adentro" y se modificaron en cada versión):

1. **Todo es un objeto.**
2. **Los objetos se comunican mandando y recibiendo mensajes** (en términos de objetos).
3. **Los objetos tienen su propia memoria** (en términos de objetos).
4. **Todo objeto es instancia de una clase** (que debe ser un objeto).
5. **La clase guarda el comportamiento compartido** de sus instancias (en forma de objetos en una lista de programa).
6. **Para evaluar una lista de programa, el control se pasa al primer objeto** y el resto se trata como su mensaje.

De (1) y (4) se sigue que **las clases son objetos y deben ser instancias de sí mismas**. De (6) se sigue una **sintaxis universal tipo LISP**, pero con el objeto receptor primero, seguido del mensaje:
```
receptor | mensaje
c        | °i <- d*e
```

**Expresiones "simples" como `a+b` y `3+4`**: Kay las interpreta también como `receptor | mensaje` (`3 | +4`). Esto lleva al **polimorfismo** (término que Kay atribuye a Strachey, aunque dice que no es del todo apto): buscar comportamientos genéricos para los símbolos de mensaje. Ejemplo: `+` puede significar concatenar strings o sumar matrices según el objeto.

**Protección total**: como el control se pasa a la clase **antes** de considerar el resto del mensaje, la clase puede decidir no recibir. Los objetos de Smalltalk-72 son "brillantes" (shiny) e impenetrables. Parte del entorno es el binding del SENDER en el "objeto messenger" (registro de activación generalizado), que permite privilegios diferenciales.

**Función vs. clase**: Smalltalk-72 mantenía de Smalltalk-71 la mezcla de ideas de función y clase. Las clases parecían y se usaban como funciones, pero se podía producir una instancia (una especie de *closure*) con el objeto `ISNEW`. Factorial se podía escribir "extensionalmente" o "intensionalmente". **Toda la idea de OOP es definir todo intensionalmente.** A Kay no le gustaba la sintaxis (demasiados paréntesis y anidamientos) y quería algo más plano y gramatical (lo veríamos en Smalltalk-76).

> 💡 **Nota técnica — polimorfismo**
> Capacidad de que un mismo nombre de mensaje (ej. `+`, `print`) produzca comportamientos distintos según la clase del objeto receptor. En Smalltalk cada objeto decide qué hace con el mensaje que recibe.

> 💡 **Nota técnica — intensional vs. extensional**
> Definir algo **extensionalmente** es listar/calcular sus elementos directamente; **intensionalmente** es definir la propiedad/comportamiento que los caracteriza. OOP busca definir todo intensionalmente (vía comportamiento del objeto), no manipulando su estado interno.

### 11.4.1 Desarrollo del sistema Smalltalk-72 y aplicaciones

El intérprete de Smalltalk-72 en el ALTO no era veloz ("majestuoso", según Butler), pero era fácil de cambiar y suficientemente rápido para sistemas interactivos en tiempo real. Aplicaciones desarrolladas (muchas en pocas páginas de código):

- **Ventanas superpuestas** (con Diana Merry), y un primer **bitblt** (operador de transferencia de bloques de bits para fuentes de paso variable). Las ventanas fueron la clase más rediseñada. Usaban las convenciones de **GRAIL** (esquinas sensibles para mover, redimensionar, clonar y cerrar).
- **Tortugas LOGO orientadas a objetos** (Ted Kaehler): se podían crear muchas instancias de tortuga; Dan creó tortugas "comandante" que controlaban tropas de tortugas.
- Editor estructurado de código (John Shoch).
- **miniMOUSE** (Larry Tesler): el primer editor **WYSIWYG** sin modos (*modeless*) de PARC.
- Documentos **multimedia** (Steve Weyer y otros): cada componente del documento maneja su propia edición.
- **Findit** (Steve Weyer y Kay): recuperación por ejemplo, usado años por la biblioteca de PARC.
- Música: síntesis por muestreo (12 voces en tiempo real), **TWANG** (Ted Kaehler), síntesis FM en tiempo real (Steve Saunders), y **OPUS** (Chris Jeffers), primer sistema de captura de partituras en tiempo real que no exigía tocar a ritmo metronómico.
- Animación: **Steve Purcell** logró "tasas Disney" (10-15 fps); de ahí salió **Shazam** (sistema de animación de ~5-6 páginas, basado en GENESYS de Ron Baecker).
- **PYGMALION** (tesis de Dave Smith): programación icónica/"por demostración" — el programa más grande escrito en Smalltalk-72 (~20 páginas, todo lo que entraba en el ALTO). Origen de los sistemas de "programming by example".
- **Simpula**: versión simple del enfoque de "sequencing set" de SIMULA para scheduling. Los chicos lo usaban para modelar parques de diversiones, escuelas, negocios. Base del futuro **Smalltalk Sim-kit**.
- Estructura de control `Zahn` (event-driven case, sin `goto`) implementada por John Shoch.

> 💡 **Nota técnica — bitblt (Bit Block Transfer)**
> Operación que copia/combina bloques rectangulares de píxeles en memoria de pantalla. Es el operador 2D fundamental para mover ventanas, dibujar fuentes, etc. Diana Merry hizo una versión temprana; luego se rediseñó y se metió en microcódigo. Sigue siendo central en gráficos.

> 💡 **Nota técnica — WYSIWYG**
> "What You See Is What You Get": lo que ves en pantalla es lo que se imprime. miniMOUSE de Tesler fue pionero. Tesler luego llevó estas ideas a Apple.

### 11.4.2 La evolución de Smalltalk-72

**Smalltalk-74** (alias "FastTalk"): mejoras mayores — un objeto "messenger" real, diccionarios de mensajes para clases (paso hacia clases-objeto reales), el bitblt rediseñado por Dan en microcódigo, mejor interfaz de ventanas. Dave Robson se sumó y ayudó a formular una semántica oficial.

La gran incorporación: **OOZE** (Object-Oriented Zoned Environment), el sistema de **memoria virtual** que sirvió a Smalltalk-74 y especialmente a Smalltalk-76. El ALTO era chico (128-256K), así que se quedaban sin memoria. OOZE intercambiaba (swap) objetos individuales:

- Ideas clave: gastar un pequeño porcentaje de tiempo "purgando" objetos sucios para mantener memoria limpia (insight de Lampson en GENIE); un mecanismo de decisión estocástico (de FLEX) para decidir qué objeto descartar.
- Integridad de punteros: una **"transaction"** completa (idea de Butler) que garantizaba recuperación sin importar cuándo se colgara el sistema ("protección contra rayos cósmicos", porque los ALTOs se colgaban una o dos veces por día sin motivo).
- Usaban una **Resident Object Table (ROT)** como único lugar con direcciones de máquina de los objetos, y un esquema de **checkpointing** que aseguraba una imagen recuperable de no más de unos segundos de antigüedad.
- OOZE manejaba ~65K objetos (varios megabytes) en solo 80KB de memoria de trabajo.

> 💡 **Nota técnica — memoria virtual / swapping**
> Técnica para usar el disco como extensión de la RAM, moviendo (swap) datos entre disco y memoria. OOZE lo hacía a nivel de objetos individuales, lo cual era novedoso. El *garbage collection* (recolección de basura) automática de objetos no usados es parte de este mundo.

### 11.4.3 El estilo "orientado a objetos"

Sección clave conceptual. Kay distingue OOP de los **"tipos de datos abstractos" (abstract data types)** que se empezaban a estudiar en la academia:

- Un ADT (como la definición de "par LISP") preserva el "acceso a campos" y "rebinding de campos" — es decir, sigue siendo una **estructura de datos**.
- El mundo académico veía a Simula como vehículo para definir ADTs (y eso fue al backbone de ADA, con el ubicuo ejemplo de la "pila"). **Kay se horrorizó**: para él, Simula susurraba algo mucho más fuerte. **Lo que Simula le dijo fue que se podían reemplazar los bindings y la asignación por *metas* (goals).**
- Lo último que querés es que un programador toque el estado interno, aunque sea figurativamente. Los objetos deben presentarse como **sitios de comportamientos de alto nivel**, apropiados para usarse como componentes dinámicos.

Crítica de Kay (ya en 1993): mucho de lo que se llama "OOP" hoy es **programación al viejo estilo con constructos más sofisticados** — programas llenos de operaciones "tipo asignación" hechas con procedimientos caros.

**¿De dónde viene la eficiencia especial de OOP?** Cuatro técnicas usadas juntas:
1. **Estado persistente** (persistent state),
2. **Polimorfismo**,
3. **Instanciación**,
4. **Métodos-como-metas** (methods-as-goals).

Ninguna requiere un lenguaje OO (ALGOL 68 casi se puede forzar a este estilo); un OOPL solo **enfoca la mente del diseñador** en una dirección fructífera. Pero hacer el encapsulamiento bien es un compromiso no solo con abstraer el estado, sino con **eliminar las metáforas orientadas al estado** de la programación.

**Principio más importante (derivado de los SO)**: cuando le das a alguien una estructura, rara vez querés que tenga privilegios ilimitados. Type-matching no alcanza. **Hacelos a todos ciudadanos de primera clase y protegelos a todos.**

El menor tamaño de un buen sistema OOP viene del **"bang por línea de código"**: el objeto carga significado e intención, sus métodos sugieren metas fuertes, y sus superclases agregan mucha más funcionalidad que los procedimientos sobre estructuras de datos. Idea final: **OOP es una estrategia de *late binding* (ligadura tardía)** de muchas cosas, lo que pospone la fragilidad y la explosión de tamaño mucho más que las metodologías viejas. *"Los programadores humanos no son máquinas de Turing — y cuanto menos requieran sus sistemas técnicas de máquina de Turing, mejor."*

> 💡 **Nota técnica — late binding (ligadura tardía)**
> Decidir lo más tarde posible (idealmente en tiempo de ejecución) detalles como qué método se ejecuta, dónde está algo, cómo se representa. Es lo opuesto a "compilar todo rígidamente de antemano". Kay considera el late binding el corazón de OOP (volverá sobre esto en la Coda).

### 11.4.4 Smalltalk y los chicos

A partir del verano del 73 empiezan los experimentos con chicos. Se suman **Adele Goldberg** y Steve Weyer (venían de Pat Suppes en Stanford).

- Primeros experimentos: imitar las tortugas de LOGO. Resultado decepcionante: los chicos dibujaban pero "no pasaba mucho más allá de efectos de superficie". Kay sentía que el contenido de esta nueva alfabetización debía ser la **creación de herramientas interactivas por los chicos**, no la gráfica procedural de tortugas.
- **El "Joe Book" de Adele**: enfoque brillante para enseñar Smalltalk como lenguaje OO, influido por Minsky (enseñar holísticamente con ejemplos de programas serios). Se creaban instancias de la clase `box`, se les mandaban mensajes, hasta llegar a una animación multiproceso simple. Tras adivinar qué podía ser un `box`, se les mostraba la definición de la clase (con métodos `draw`, `undraw`, `turn`, `grow`, `ISNEW`).
- **Proyectos de chicos que fueron herramientas reales**: sistema de pintura de Marion Goldeen (12), sistema de ilustración OO de Susan Hamet (12, parecido al futuro MacDraw), captura de partituras de Bruce Horn (15), diseño de circuitos de Steve Putz (15).
- **Reality check ("early success syndrome")**: los éxitos eran reales pero no tan generales como creían. Los chicos eran de Palo Alto (no un promedio). En parte veían el "fenómeno hacker": para cualquier actividad, un 5% se zambulle naturalmente, mientras que el ~80% puede aprenderlo pero no le resulta natural.
- **El problema era el diseño, no la mecánica.** En primavera del 74 Kay enseñó Smalltalk a 20 adultos no programadores de PARC. Avanzaron rápido pero chocaron con un problema de base de datos tipo rolodex que parecía simple. Kay contó las "ideas no obvias" del programita: eran **17**, algunas como "el concepto del arco en arquitectura: muy difíciles de descubrir si no las conocés ya".

**La conexión con la alfabetización (literacy)**: aprender a leer y escribir no alcanza; hay una **literatura** que organiza ideas. Adele inventó las **design templates** (plantillas de diseño): un intermediario entre las ideas vagas y el código detallado, para descomponer un problema en clases y mensajes sin preocuparse aún por cómo funciona cada método.

- Funcionó, pero no lo suficiente. Empujaron la idea de **herencia** para que novatos construyeran sobre frameworks diseñados por expertos (Lisa van Stone, 12 años, modificó Shazam). Pero la **herencia resultó muy difícil para novatos (e incluso profesionales)**.
- Conclusión retrospectiva de Kay: el enfoque de design templates era bueno, pero no lo aplicaron "longitudinalmente" lo suficiente. Programar, para el "80%", se parece más a la **escritura**: hay que aprenderlo gradualmente durante años para construir las estructuras mentales de diseño.

**Reflexión más amplia y escéptica de Kay**: ¿deberíamos siquiera enseñar programación? Dice no ver una influencia clara de la programación en la capacidad general de pensar de los programadores que conoció ("si acaso, lo contrario"). "La música no está en el piano." Las herramientas dan un camino y un contexto, pero **ninguna herramienta contiene ni dispensa el esclarecimiento**. Cita a Pavese: *"para conocer el mundo debemos construirlo"* — hacemos no solo para tener, sino para conocer.

Sobre la **fluidez (fluency)** y la **metáfora**: la fluidez es construir estructuras mentales que hacen desaparecer la interpretación de las representaciones (las letras se experimentan como significado; la raqueta o el teclado como extensión del cuerpo). El "truco" de las artes liberales es volverse fluido y profundo mientras se construyen relaciones con otros conocimientos fluidos y profundos. Su definición de **alfabetización del siglo XX** incluye poder oír de una enfermedad contagiosa y entender al instante que hay una relación exponencial desastrosa — e incluso construir una simulación del sistema en la computadora personal.

Observaciones sobre chicos: hasta nenes de 2-3 años pueden usar la interfaz tipo Smalltalk. Chicos de tercer grado aprenden 50+ "herramientas transformacionales" en días y contestan preguntas que requieren **una** transformación, pero les cuesta mucho las que requieren **dos o más** transformaciones. Lo que hay que aprender es a **empaquetar transformaciones de a dos o tres** hacia una meta (como aprender un juego estratégico tipo damas).

---

## 11.5 — 1976-1980: El primer Smalltalk moderno (-76)

A fines de 1975 Kay siente que pierden el equilibrio: la idea del "Dynabook para chicos" se diluía frente a las necesidades profesionales. En enero de 1976 lleva al grupo a un retiro de 3 días en Pajaro Dunes: **"Let's Burn Our Disk Packs"** (quememos nuestros discos). Su argumento (con un aforismo): *"ningún organismo biológico puede vivir en sus propios desechos"* — pedía un arranque realmente fresco, distinto del ALTO y de Smalltalk. Todos coincidían en que el poder de Smalltalk no alcanzaba sus aspiraciones, pero los grad students querían un Smalltalk mejor, más rápido y para problemas más grandes.

Resultado: Kay empieza a diseñar una máquina nueva, la **NoteTaker**, y **Dan empieza a diseñar Smalltalk-76**. La cohesión absoluta de los primeros cuatro años no volvió a cuajar.

Razón del "quemar los discos": una sensación muy McLuhaniana — *"una vez que damos forma a las herramientas, ellas nos dan forma a nosotros"*. Los paradigmas fuertes (LISP, Smalltalk) son tan convincentes que **"se comen a sus crías"**: cuando mirás una aplicación, se parece al sistema, no a una idea nueva. Kay en 1975 veía algo grande pero **no veía un lenguaje de usuario final** ni la solución al medio de "lectura y escritura" para chicos.

**La NoteTaker**: una "laptop" usando los (casi disponibles) chips de RAM de 16K. Sin mouse (que Kay odiaba) ni tableta; inventó un dispositivo apuntador embebido, el **"tabmouse"**. Arquitectura multiprocesador de chips lentos pero integrados, con un nuevo intérprete bytecodeado más simple que Smalltalk-72.

**Smalltalk-76** (Dan Ingalls, basado en [Ingalls 1978]): el primer gran cambio fue **eliminar el dualismo función/clase** en favor de una definición **completamente intensional**, con cada pieza de código como un método intrínseco. Había fuerte demanda de un **mecanismo de herencia real** (de Adele, Kay, Larry Tesler). Dan necesitaba algo mejor que la concepción rígida de tiempo de compilación de Simula. Se hizo realidad la idea de que **"todo es un objeto"**, incluyendo los objetos internos del sistema (como los registros de activación).

- La sintaxis super flexible de los Smalltalks anteriores era **demasiado** flexible. Dan creó una sintaxis combinada **keyword/operador**, legible sin ambigüedad por humanos y máquina. Esto permitió un compilador de byte-codes tipo FLEX y un intérprete eficiente que corría **hasta 180 veces más rápido** que el intérprete directo anterior. OOZE se adaptó a los objetos nuevos.

### 11.5.1 Herencia

Resumen histórico de Kay:
- **Simula-I**: no tenía ni clases-como-objetos ni herencia.
- **Simula-67**: agregó herencia como generalización de la estructura `<block>` de ALGOL-60. Gran idea, pero con desventajas: rigidez en las estructuras de tipos extendidas, necesidad de calificar tipos, **un solo camino de herencia**, y dificultad para adaptarse a desarrollo interactivo con compilación incremental.
- Había problemas fuera del alcance de Simula (modelado e inferencia tipo IA): no todas las preguntas útiles se responden siguiendo una cadena estática; algunas requieren "herencia"/"inferencia" a través de partes ligadas dinámicamente. La **herencia múltiple** parecía importante pero los choques de métodos del mismo nombre eran difíciles.

Por eso Kay **dejó la herencia afuera de Smalltalk-72** (sabiendo que se podía simular con la flexibilidad tipo LISP). El mayor contribuyente de estas ideas fue **Larry Tesler**, que usó "slot inheritance" (hoy se llamaría **herencia por delegación**) en sus sistemas de desktop publishing. **Bobrow y Winograd** diseñaban KRL (lenguaje de IA basado en frames, "orientado a objetos", influido por Smalltalk temprano) con herencia múltiple llamada *perspectives*.

En **Smalltalk-76**, Dan llegó a un esquema **tipo Simula en su semántica pero modificable incrementalmente en caliente**. Kay no estaba del todo conforme (sentía que hacía falta una mejor teoría de la herencia — y dice que todavía falta): la herencia y la instanciación mezclan pragmática (factorizar código para ahorrar espacio) y semántica (especialización, generalización, especiación). **Alan Borning** usó herencia múltiple en **Thinglab** (implementado en Smalltalk-76), pero ningún esquema de herencia múltiple limpio fue lo bastante convincente como para superar el diseño tipo Simula de Dan.

> 💡 **Nota técnica — herencia / herencia por delegación**
> Mecanismo por el cual una clase (subclase) hereda comportamiento de otra (superclase). La **delegación** es una variante donde un objeto reenvía mensajes que no sabe manejar a otro objeto "padre". La herencia múltiple (heredar de varias superclases) trae el problema de conflictos de nombres de métodos.

### La batalla con Xerox y "A Simple Vision of the Future"

Había ~500 ALTOs conectados por **Ethernet** a impresoras láser y servidores de archivos. Kay escribía memos a los planificadores de Xerox. El texto incluye un memo suyo ("A Simple Vision of the Future", actualización del Pendery Paper de 1971) que predice con asombrosa precisión: en los 90 habrá millones de PCs del tamaño de un cuaderno, con displays planos, menos de 10 libras, llamados Dynabooks; el precio será como el de un TV color; la mayoría se regalarán porque se venderá el **contenido**, no el contenedor; estarán conectadas a "utilidades de información" globales por cable y packet radio.

Puntos del memo: hacen falta pocos tipos de hardware; **Personal Computers + Communications Links + Information Utilities** son los tres componentes críticos. El **material** de un sistema de computación es la computadora misma; **todo el contenido y la función se hacen en software** (replicación: costo cero; desarrollo: costo alto; cambio: costo bajo).

**La decisión fatal de Xerox (agosto 1976)**: Chuck Thacker diseñó el **ALTO III** (con chips de 16K, listo para escritorio, comercializable al precio de un procesador de texto). Xerox decidió **no llevarlo al mercado**. Kay: en 1992 el mercado mundial de PCs/workstations era de $90 mil millones (el doble que mainframes/minis), y **la empresa más exitosa de la era —Microsoft— no es de hardware sino de software**.

> 💡 **Nota técnica — Ethernet y el ALTO**
> Ethernet (red de área local por conmutación de paquetes) fue inventado en PARC por Bob Metcalfe. Los ALTOs en red con impresoras láser y servidores de archivos eran, en 1976, el prototipo completo de la oficina informática moderna — una década antes de que el mundo lo tuviera.

### 11.5.2 La interfaz de usuario de Smalltalk

Kay explica el origen de la interfaz de ventanas superpuestas (ya hay >20 millones de computadoras usando sus descendientes). Todos los elementos ya existían en los sesenta (Lincoln Labs y RAND, ambos financiados por ARPA). El gran cambio fue que **el foco del LRG era en los chicos** y por lo tanto en el **aprendizaje**: una rotación de 90 grados del propósito de la interfaz — de **"acceso a la funcionalidad"** a **"entorno donde los usuarios aprenden haciendo"**. Esto conectaba con Montessori, Dewey y Bruner: un "currículum de la interfaz de usuario".

Síntesis de los principios de diseño de la UI (juntando varias influencias):
- Un entorno aparentemente libre donde la exploración causa que sucedan las secuencias deseadas (**Montessori**);
- que permita aprendizaje kinestésico, icónico y simbólico — *"hacer con imágenes hace símbolos"* (**Piaget y Bruner**);
- donde el usuario **nunca queda atrapado en un modo** (**GRAIL**);
- donde la magia está embebida en lo familiar (**Negroponte**);
- y que actúe como un **espejo amplificador de la propia inteligencia** del usuario (**Coleridge**: "la gente va al buen teatro ansiando recordar").

La consolidación se atribuye a **Dan Ingalls** (escuchar a todos, aportar ideas originales, construir constantemente para testeo de usuarios). Kay aportó el contexto y la invención de las ventanas superpuestas; Adele y Kay diseñaron los experimentos. **Dave Smith** diseñó SmallStar, el prototipo de la interfaz icónica del Xerox **Star**.

### 11.5.3 Smalltalk-76

Dan terminó el diseño en noviembre; él, Dave Robson, Ted Kaehler y Diana Merry implementaron el sistema desde cero (reescribiendo todas las definiciones de clase) en **solo 7 meses**. Era rápido, vivo, manejaba problemas grandes y era divertido. ~50 clases en ~180 páginas de código fuente (incluía SO, archivos, impresión, servicios Ethernet, ventanas, editores, gráficos y pintura), más dos aportes de **Larry Tesler**: los famosos **browsers** (de métodos estáticos en la jerarquía de herencia) y los **contextos dinámicos** para debugging. *"Todos los Smalltalks posteriores se parecen mucho a esta concepción."*

El paper muestra dos clases de ejemplo (`Window` y `DocWindow`): el código se expresa como **metas para otros objetos (o uno mismo)**. `Window` nota eventos y los distribuye como mensajes a sus subclases. Sintaxis: `:` = keyword cuyo argumento se manda "por valor"; `^` = "send back" (devolver); `=>` = "entonces"; `super` = delegar a la superclase.

**Primera prueba real (enero 1978)**: los 10 ejecutivos top de Xerox visitan PARC. El LRG decide **no** enseñarles Smalltalk-76, sino crear en 2 meses un sistema a medida para adultos no expertos: el **Smalltalk SimKit** (basado en Simpula). Adele fue la líder de diseño (Kay recuerda verla debuggeando el SimKit mientras amamantaba a su hija Rachel). Detalles: el sistema debía estar sellado de Smalltalk (Dave Robson hizo un esquema casi-experto para traducir errores a términos del SimKit); descubrieron que los adultos no leían bien las fuentes chicas (esto los llevó a que los ejecutivos personalizaran la pantalla, aprendiendo a usar el mouse sin darse cuenta). El día clave Ted Kaehler cambió OOZE a último momento y funcionó. **9 de 10 ejecutivos completaron una simulación** relevante a sus intereses (uno, jefe de una empresa de Xerox, modeló una línea de producción de placas PC con números reales de memoria y descubrió una falla seria en la disposición de trabajadores). Un VP que había programado en FORTRAN 15 años antes: *"así que finalmente llegamos a esto"*.

Otro sistema importante: **Thinglab** de Alan Borning (1979), primer intento serio de ir más allá de Sketchpad — un enfoque de **restricciones (constraints)** que no requería un solver omnisciente. Mostró cómo pasar del estilo "push" (empujar) al estilo "pull" (tirar), dirigido por cambios en valores. También descubrieron que los **"prototipos"** eran más hospitalarios que las clases.

**Vuelta de la NoteTaker (Intel 8086)**: los chips de Western Digital que Kay quería no aparecieron ("diffusion-ware"). En 1978 el mejor candidato era el **Intel 8086** (16 bits); necesitaban tres (intérprete, gráficos bitmap, I/O). Dan hizo que Smalltalk-76 corriera en 256K usando el "system tracer" de Ted Kaehler para clonar el sistema; apareció la **tabla de objetos indexada** (luego usada en Smalltalk-80). Casi todo el código de máquina se reescribió en Smalltalk; el kernel quedó en 6K de código 8086. Curiosamente, el intérprete corría ~2 veces más rápido que en el ALTO. La NoteTaker funcionó muy bien y **corrió a 35.000 pies en un avión** (con baterías), pero "habría aplastado cualquier regazo". Se construyeron ~10. Otra vez, lo necesario para construirla volvió a "exprimir" al usuario final original.

**La visita de Steve Jobs (1979)**: Jobs, Jeff Raskin y otros de Apple (que tenían el proyecto Lisa) visitan PARC. Más de 8 años después de inventarse las ventanas superpuestas y 6 después de que el ALTO funcionara, "la gente que realmente podía hacer algo con las ideas finalmente las vio". Usaron el **Dorado** (un "hermano mayor" veloz del ALTO, con microcódigo de Smalltalk escrito en gran parte por Bruce Horn, un ex "chico Smalltalk" todavía adolescente). Larry Tesler dio la demo. Momento famoso: Jobs no quería el scroll "por bits" y pidió scroll continuo; **Dan encontró los métodos y lo cambió en menos de un minuto** — lo que shockeó a los visitantes (nunca habían visto un sistema incremental tan poderoso). Jobs intentó comprar/obtener la tecnología, pero Xerox (que era inversor minoritario de Apple) ni la cedió ni la desarrolló internamente.

> 💡 **Nota técnica — Xerox Star, Apple Lisa y Macintosh**
> El Xerox Star (1981) fue el primer producto comercial con interfaz gráfica de ventanas/íconos (descendiente del ALTO), pero caro y comercialmente débil. La visita de Apple a PARC influyó directamente en la **Lisa** y luego la **Macintosh** (1984), que llevaron la GUI al mercado masivo. Larry Tesler dejó Xerox por Apple en 1980.

> 💡 **Nota técnica — Dorado**
> Sucesor mucho más rápido del ALTO (uno de los "D machines"). En la demo a Apple se usó porque el ALTO ya era lento para Smalltalk. Kay opina que el atraso del primer "D machine" dañó a Smalltalk: debieron seguir construyendo máquinas cada vez más rápidas hasta entender bien la OOP, en vez de regresar (en Smalltalk-76) hacia formas tipo Simula por eficiencia.

---

## 11.6 — 1980-1983: La versión de release de Smalltalk (-80)

Dan: *"La decisión de no continuar la NoteTaker dio motivación para liberar Smalltalk ampliamente."* Pero no para Kay: estaba contento con la elegancia de Smalltalk pero triste porque **ningún chico había programado en Smalltalk desde Smalltalk-76**. Xerox y PARC ahora pensaban en "workstations"; Kay seguía queriendo "playstations". El romance del Dynabook parecía más lejos justo cuando las tecnologías se volvían comercialmente posibles (varias, como el display plano, fueron abandonadas por las empresas de EEUU a los japoneses — "snatching defeat from the jaws of victory"). Larry Tesler se fue a Apple a diseñar la Lisa; Kay se tomó un año sabático.

**Adele** condujo el proceso de documentación y release de un Smalltalk distribuible casi independiente del hardware. Solo hubo que hacer unos pocos cambios a la NoteTaker Smalltalk-78:
- El más irónico: volver las fuentes custom (legibles, sello de PARC) a **ASCII estándar** — según Peter Deutsch, "se opusieron acaloradamente pero resultó esencial para la aceptación del sistema en el mundo".
- Hacer los *blocks* más parecidos a expresiones lambda (Deutsch, 9 años después: "esta proliferación de tipos de instanciación y scoping fue probablemente una mala idea").
- La idea más desconcertante para Kay: la introducción de las **metaclases** (solo para facilitar la inicialización de instancias). Deutsch: "las metaclases han resultado confusas para muchos usuarios, y quizás en el balance más confusas que valiosas". Kay opina que Smalltalk había entrado en la fase final que mencionó al principio: **una manera de hacer las cosas que finalmente se canoniza en una estructura de creencias inflexible**.

### 11.6.1 Coda (reflexiones finales de Kay)

Frase de Barton: *"Los programadores de sistemas son los altos sacerdotes de un culto bajo."*

**Hardware como "software cristalizado tempranamente"**: gran parte del progreso del software ha sido encontrar formas de **late-bind** (ligar tardíamente) cosas, y luego campañas para convencer a los fabricantes de construir esas ideas en hardware. Ejemplos de cosas que se "late-bindearon" históricamente:
- RAM (late-bind de programas/parámetros antes cableados),
- registros índice (late-bind de looping/indexing),
- base/bounds registers, relocación de segmentos, MMUs de paginación (late-bind de ubicaciones),
- recursión (late-bind de parámetros a procedimientos).

Kay se queja de que la mayoría de los hardwares de hoy son "re-optimizaciones de arquitecturas moribundas". Time-sharing se atrasó años porque los fabricantes no ponían MMUs.

**OOP desde la perspectiva del late binding**: es una técnica comprensiva para ligar tardíamente todo lo posible: la mezcla de estado y proceso, dónde están, cómo se llaman, cuándo y por qué se invocan, qué hardware se usa, y las estrategias del propio esquema OOP. *"El arte del wrap es el arte del trap"* (el truco está en atrapar excepciones eficientemente). Describe cómo `a+b` con `a` y `b` siendo "3" y "4" debe ejecutarse a toda velocidad usando lógica de *look-aside* (un trap solo si los operandos no son compatibles con la ALU); y cómo el dispatch de método (`<clase><selector>`) puede esconderse en el overhead de traducción de direcciones de la MMU.

El punto de OOP: **no tener que preocuparse por lo que hay dentro de un objeto**. Objetos hechos en máquinas y lenguajes distintos deberían poder hablarse — y tendrán que hacerlo en el futuro. Mirando más allá: anticipa el **networking omnipresente** (en los próximos 5 años), donde los objetos se volverán **agentes activos** que viajan por las redes; objetos traídos del otro lado del mundo no podrán configurarse por simple matching de protocolos, sino que cargarán más información sobre sí mismos para un **"acoplamiento inferencial"** (inferential docking). Menciona el **metaobject protocol** de PARC (Kiczales) y compara con Prolog (que no necesita bindings a valores) y Eurisko (que construye sus propios métodos — "programación oportunista").

**Teoría irónica del "sunspot"** (manchas solares): los grandes avances en lenguajes ocurren cada ~11 años. Código de máquina (1950) → FORTRAN (1956, una "mejor cosa vieja") → ALGOL-60 (1961) → SIMULA (1966, "mejor cosa vieja") → **Smalltalk (1972)** → Eurisko (1978). Pero 1983 vino y se fue sin "la cosa nueva". Kay culpa a la **comercialización masiva** de la computación personal, que "ahogó" mucho del trabajo de universidades y labs al absorber a los chicos talentosos hacia aplicaciones prácticas.

**"Vandalismo inverso"**: el problema del siglo XX es que la tecnología se volvió "demasiado fácil" — hacer cosas (sobre todo software) es trivial, pero los diseños son triviales también: *"hacer cosas porque se puede"*. El antídoto: generar enorme insatisfacción con los propios diseños usando toda la historia del arte humano como estándar, pero desacoplando esa insatisfacción de la autoestima.

Cierra dejando la historia en 1981 (artículos de *Byte* sobre Smalltalk-80) y 1983 (libros de Adele y Dave Robson, y el release oficial). Smalltalk proliferó asombrosamente y seguía siendo, según Kay, "el sistema más usado que dice ser orientado a objetos". Pregunta final: *"¿dónde están los Dans y Adeles de los 80 y 90 que nos llevarán a la siguiente etapa?"*

---

## Apéndices (lo relevante)

- **Apéndice I — Memo de la PC ("KiddiKomputer", mayo 1972)**: dirigido a Lampson, Thacker, English, Elkind, Pake. Describe "The Reading Machine". Cuatro proyectos educativos: (a) enseñar a *pensar* (à la Papert); (b) enseñar *modelos* vía simulación (música y programación); (c) enseñar habilidades de *interfaz* (ver/oír, lectura combinando representación icónica y audible); (d) ver qué hacen los chicos "extraoficialmente" con "demons" (procesos que observan). Justifica construir varias miniCOM porque el generador de caracteres ya reveló cosas sorprendentes sobre la percepción humana.

- **Apéndice II — Diseño del intérprete de Smalltalk**: cómo Kay ganó la apuesta. Muchos detalles del elegante esquema de McCarthy se podían "finesear" si había objetos que manejaran distintos tipos de recepción parcial de mensajes (evaluado, no evaluado, literal). Usó el enfoque de Dave Fisher. Decidió **ignorar la metafísica de los objetos** (que las clases existan en runtime como objetos de primera clase, que haya "class-class" instancia de sí misma, etc.) porque no hacía falta para ganar la apuesta. La interpretación va de **izquierda a derecha**: el primer elemento se evalúa en el objeto receptor, y todo lo que sigue es el mensaje. Resume cómo se "argumentaron" casi todas las partes del eval: recepción de mensajes por objetos en código normal; estructuras de control por objetos que acceden a los contextos; variables como objetos que reciben `value` y `<-`; etc. *"Un send no es como un cartero entregando una carta, sino entregando un aviso de dónde está la carta — el receptor decide qué hacer."*

- **Apéndice III — Acknowledgments (documento de marzo 1973)**: lista de influencias declaradas en su momento. Destaca: filosofía inspirada en Papert/MIT; el Dynabook como "ahijado" de la LINC de Wes Clark y descendiente del FLEX; el ALTO como creación de Thacker y McCreight; Smalltalk como "síntesis de ideas bien conocidas de los últimos 15 años"; "SMALLTALK es definitivamente LISP-like"; influencia central del B5000, las SIMULAs, el FLEX, y el **CDL de Dave Fisher** (la mayor fuente de la semántica de control de Smalltalk). La charla de Barton en Alta (1968) sobre computadoras como dispositivos de comunicación fue "la verdadera génesis". Principio resumen: **hacer que las PARTES tengan las mismas propiedades y poder que el TODO** — Smalltalk recurre sobre la noción de "computadora" en vez de "subrutina".

- **Apéndice IV — Event Driven Loop Example**: ejemplo de cómo se definía una clase `event` y una estructura `until` controlada por eventos. "Este tipo de juego era parte de la euforia general de tener un lenguaje realmente extensible... Eventualmente nos calmamos y nos enfocamos en estructuras más simples y de mayor poder."

- **Apéndice V — Estructuras internas de Smalltalk-76**: muestra un método compilado en byte-codes de la clase `Rectangle` (entre lo "estático" y lo "dinámico"), con el program counter ejecutando. "Este esquema general se remonta al B5000 y al FLEX, pero está mucho más refinado."

- **Apéndice VI — Documentación**: incluye un "paisaje general de los sesenta" con tablas de las tecnologías que aportaron a OOP (USAF ATG file system, B5000/Barton, Sketchpad/Sutherland, B220 COBOL coroutines/Conway, Simula/Nygaard-Dahl, FLEX/Kay, Simula-67/herencia, CAL-TSS/Lampson) y sistemas no-OOP que aportaron (LISP, JOSS, EULER/APL, PLANNER, CDL). Lo que tenían en común esos diseñadores: **interés en encontrar estructuras simples y generales para "fintar" dificultades, en vez de producir grandes cantidades de código**.

---

## La presentación de Alan Kay (transcripción)

Kay da una charla sobre "el romance del diseño": cómo se hace realmente la innovación radical (no la mejora incremental). En PARC en 1974 había, sin un plan maestro de management: la primera PC/workstation, la primera interfaz de ventanas superpuestas, la primera OOP moderna, la primera impresora láser y la primera LAN por conmutación de paquetes — hechas por grupos distintos de gente amigable que decidió hacerlas. La filosofía ARPA: **financiar personas y direcciones, no proyectos y metas**.

Marcos conceptuales que usó:
- **Koestler — "Bisociación"** (*The Act of Creation*): pensamos relativo a contextos (paradigmas, à la Kuhn). La creatividad "normal" mejora dentro del contexto; la "revolucionaria" te catapulta a un contexto distinto. *"Las ideas terríficas se esconden detrás de las buenas"* — el enemigo de una idea genial es una buena idea (porque hay muchas razones para quedarse con la buena). La creación se parece a un chiste: te llevan por un camino y de golpe estás en otra situación. Reacciones emocionales: chiste = "ja", ciencia = "ajá", arte = "aah" (y, agregó Kay, también "uh oh", "oh no" y "oh!").
- **McLuhan**: *"No sé quién descubrió el agua, pero no fue un pez."* No vemos el medio/creencias en que estamos inmersos (la "pecera"). La cultura es una mejor pecera. Saltar de una pecera a otra es tan difícil como ser totalmente creativo; muchos que saltan se vuelven aún más religiosos sobre la nueva pecera. La ciencia a veces hace una mejor pecera mientras salta.
- **La rana**: el ojo de la rana no le dice mucho al cerebro de la rana. Una rana rodeada de moscas paralizadas se muere de hambre (no ve la mosca como comida). *Las ideas son como esas moscas: están enfrente todo el tiempo pero no las vemos.* Principio: todos los sistemas nerviosos son inconscientes de la mayor parte del entorno todo el tiempo. *"Solo podés aprender a ver cuando te das cuenta de que sos ciego."*

Sobre la gente clave:
- **Los financiadores de ARPA** (Licklider >40, Sutherland 26, Bob Taylor 34, Larry Roberts 31): financiaron una de las mejores décadas de la historia.
- **Dave Evans**: trataba a los grad students como colegas absolutos (Kay voló 140.000 millas como estudiante). Su idea: cuando trabajás en la parte "principal" de un problema probablemente estás equivocado (es el camino más obvio); preocupate por las **condiciones de excepción**. "Siempre dejá un bit extra."
- El contexto de Utah era **3D a gran escala** (CAD/arquitectura), con estructuras de datos órdenes de magnitud más grandes que la computación común → necesitabas un **principio de arquitectura**, no podías programar con estructuras frágiles. *"Podés hacer una casa de perro con casi cualquier cosa"* — pero no un sistema complejo. Crítica de Kay: enseñar **algoritmos como primer curso de programación** es lo peor, da una idea limitada de qué son las computadoras.
- **Simula como punto de cruce (cruxpoint)**: el más grande desde LISP. Lo "normal" era verlo como una mejor cosa vieja (mejor que ALGOL) y derivar tipos de datos abstractos. Kay, que no sabía mucho de ciencias de la computación, vio en Simula **tejidos/células** — montones de cosas independientes ("procesos") comunicándose. Eso lo transformó de pensar las computadoras como mecanismos a pensarlas como lugares donde hacer **organismos tipo biológico** (complejidad de 10⁹ a 10¹³). *"Después de Simula, los procedimientos me parecían la peor manera posible de hacer cualquier cosa."*
- **Bob Barton** ("el fantasma que camina"): *"Mi trabajo es desengañarlos firmemente de todas las nociones queridas que trajeron a este aula."* Liberador: nada era sagrado. Evans sobre Barton: "no nos importa que sean prima donnas, mientras puedan cantar".
- **Ivan Sutherland**: *"No sabía que era difícil."* Génesis de Sketchpad: vio lo mal que estaba el display de la TX-2 y en vez de rechazarlo preguntó "¿qué más puede hacer?".
- **Marvin Minsky**: *"Tenés que formar el hábito de no tener razón por mucho tiempo."* No formes distinciones, formá "tri-stinciones".
- **El mejor libro sobre diseño de sistemas complejos**: *The Federalist Papers* (de Hamilton, Madison y Jay).

En el **video** mostró: los ALTOs tempranos; cómo Adele enseñaba con "Joe" (instancia de `box`); el sistema de pintura de Marion Goldeen (12, que enseñó la clase al año siguiente); el sistema tipo MacDraw de Susan Hamet (12); la animación de Steve Purcell; Shazam; el editor de timbres FM (primer FM en tiempo real, Saunders y Kaehler) tocando una fuga de Bach; el SimKit; y **Playground**, donde chicos programaban un pez payaso con ~25 procesos paralelos (forrajeo, evitación de depredadores, refugio en la anémona) — *"un programa más complejo que el que escribe la mayoría de los universitarios"*. Cierre: *"los griegos pensaban que las artes visuales eran la imitación de la vida... pero las artes de la computadora son la imitación de la creación misma."*

---

## Comentarios de Adele Goldberg (discussant)

Adele —que se unió a PARC en 1973, fue la "usuaria representante"/"policía del aprendizaje", luego manager del System Concepts Group/Laboratory, editó el número de *Byte* de 1981, fue presidenta de la ACM (1984-86), fundó ACM Press y OOPSLA, y luego CEO de **ParcPlace Systems**— resume Smalltalk no como la evolución de un lenguaje sino como **una historia de cultura, organización y visión**.

Lecciones que extrae de Alan Kay:
1. **"Elegí un sueño, hacelo realidad."** (Kay: *"No predigo el futuro, lo hago."*) El sueño parte de la idea —sorprendente entonces— de que **las computadoras no son interesantes; lo interesante es lo que la gente puede hacer y acceder con ellas.** La clave es el software, que llamaron Smalltalk.
2. **"Contratá gente que no sepa que lo que querés que hagan es difícil."** Kay fue a Xerox y contrató gente poco ortodoxa, "demasiado ingenua y llena del sueño para saber que el problema era difícil".
3. **"Si no compartís tus resultados, podés quemar los discos y empezar de nuevo."** (Aunque violaba otro consejo de Kay: *"No tengas clientes; esperan soporte."*)
4. **"Tené cuidado con lo que deseás, porque lo vas a conseguir."**

Aportes de Adele al diseño:
- Trabajar con chicos introdujo la **pedagogía como objetivo de calidad**, lo que motivó cambios importantes para soportar "aprender haciendo" y "aprender leyendo". Esto les permitió ver el problema **no como crear un lenguaje de programación, sino como crear un sistema para crear sistemas** (legibles y escribibles por quien entienda el dominio). La **legibilidad** se volvió un desafío crítico para la UI.
- Insistió (sin éxito total) en que **poder enseñar Smalltalk a chicos no implicaba haber resuelto el problema de aprendibilidad para adultos**: los adultos vienen con sus propias ideas; las capacidades de **simulación/modelado de información** son el determinante clave del éxito.

Historia del release y la frustración con Xerox:
- En 1979, en modo "programación de sistemas", crearon el "Smalltalk Hall of Shame", cuyo primer miembro fue el jefe de PARC que dijo que a nadie le interesaba andar cargando computadoras.
- El proyecto **Monk** (Tesler y Goldberg): dar a los técnicos de Xerox un Dynabook con info de las copiadoras. No lo financiaron.
- **Steve Jobs** sí "entendió la idea" y volvió con todo el equipo de Lisa; tras una discusión de pasillo de 2 horas, los managers obligaron a Adele a darles una demo en profundidad. *Ellos tomaron la idea.*
- Decidieron compartir publicando **el sistema Smalltalk-80 mismo** (no libros sobre un sueño, para no arriesgar que la gente entendiera mal los esquemas).

El proceso de release de **Smalltalk-80** (multivendor): eligieron empresas que hacían hardware pero tenían equipos de software in-house — **Apple, Hewlett-Packard, DEC y Tektronix** (sugerencia de Burt Sutherland). Tenía tres partes: rediseñar el sistema subsistema por subsistema (pudieron hacerlo gracias a la capacidad de convertir todos los objetos de una clase en objetos de otra, casi instantáneamente — Ted Kaehler lo comparó con "botar un barco mientras todavía se construye"); los ingenieros definieron la especificación formal de la **máquina virtual** e implementaron el intérprete de byte-codes con distintos esquemas de gestión de memoria (publicado en *Smalltalk-80: Bits of Wisdom, Words of Advice*, ed. Glenn Krasner); y Adele con Dave Robson documentaron (escribieron tres libros, publicaron el tercero).

- El número de *Byte* de agosto 1981 (con la tapa del globo aerostático de Smalltalk, idea de Dan Ingalls) generó una avalancha de pedidos de compra de universidades y empresas de todo el mundo.
- Más decepciones de Xerox: el proyecto **Twinkle** (una máquina Smalltalk-80 de bajo costo basada en 68000, 1982) fue ignorado y "reapareció en 1984 como una variedad de Apple". Tuvieron que hacer una versión para el Star ("Molasses") en el entorno Mesa.
- El sistema **Analyst** (de Xerox Special Information Systems, basado en releases tempranos de Smalltalk) terminó usándose **en producción en la CIA** — y aun así Xerox no invirtió en ingenierizarlo.
- Recién en 1986-87, con nuevo liderazgo, se aprobó iniciar un negocio: en 1988 se fundó **ParcPlace Systems** (Adele fue CEO/presidenta 1988-92). Tras 5 años, la base del lenguaje cambió poco pero la tecnología de implementación se rediseñó por completo (primer Smalltalk reutilizable y totalmente compilado, corriendo en 11 plataformas; Peter Deutsch lideró el rediseño de la máquina virtual). Se agregaron **closures de bloques**, **manejo de excepciones**, bibliotecas y puentes a C y bases de datos.
- En 1993 había muchos vendors y consultoras de Smalltalk; ANSI creó el comité X3J20 (estándar Smalltalk). *"10 años después de su primera publicación, Smalltalk sigue siendo un objeto sorprendentemente persistente."*

> 💡 **Nota técnica — máquina virtual (VM) y byte-codes**
> Smalltalk-80 se especificó como una **máquina virtual**: un intérprete de byte-codes portable. Cada fabricante implementaba esa VM en su hardware. Esto permitió que el mismo Smalltalk corriera en muchas máquinas distintas — el mismo modelo que después popularizó Java ("compilar una vez, correr en cualquier lado").

---

## Sesión de preguntas y respuestas (lo destacado)

- **¿Futuro de Smalltalk vs C++?** Kay: los lenguajes de programación deberían "explotar" cada 20 años porque cuando duran demasiado **contaminan ideas futuras**. No ve correlación entre cuánta gente usa un lenguaje (o cuánto dura) y cuán bueno es. Lo más importante de Smalltalk/LISP que no mencionó en la charla: la **facilidad de meta-definición** — no tomar el lenguaje como una colección de features de un diseñador, sino como una manera de **habilitar el lenguaje que realmente necesitás** para escribir un sistema.
- Adele: desprecia las estadísticas; los lenguajes se diseñan para propósitos específicos. Lo que hace falta es facilitar que la gente que conoce su dominio **invente su propio lenguaje** para expresar sus ideas (por eso el SimKit es interesante).
- **¿OOP con miles de partes vs OOP para que los chicos piensen — están relacionadas?** Kay: cada nuevo medio para capturar ideas trae modos de pensamiento. Los modos de pensamiento falaces sobre la computación tienen que ver con **sistemas complejos de muchas partes interactuando**, algo muy difícil de pensar con la matemática y los medios viejos. Darles a los chicos una forma de atacar la complejidad (aunque para ellos sea "cien objetos ejecutando simultáneamente") los mete en un espacio de pensamiento más interesante.
- **¿Las "D machines" ayudaron o perjudicaron a Smalltalk?** Kay: opinión personal — el atraso de la primera D machine **perjudicó** a Smalltalk. Xerox no entendió las implicaciones; Smalltalk-76 incluso **regresó hacia formas tipo Simula por eficiencia**. Debieron seguir construyendo máquinas más rápidas hasta entender bien qué era el diseño orientado a objetos.

---

## Glosario rápido de tecnologías y personas

**Tecnologías / sistemas**

| Nombre | Qué es / por qué importa |
|---|---|
| **Burroughs B5000** (1961) | Mainframe de Bob Barton; byte-codes, memoria virtual segmentada, descriptors (referencias seguras), PRT, protección tipo capability. Fuente conceptual mayor de Smalltalk. |
| **Sketchpad** (1963) | Primer programa de gráficos interactivos (Sutherland); masters/instances, restricciones, ventanas con clipping/zoom. |
| **Simula I / 67** | Lenguajes de simulación noruegos; introdujeron clases, instancias con estado propio, y (Simula-67) la herencia. Ancestro directo de OOP. |
| **LISP** (1960) | Lenguaje de McCarthy; intérprete metacircular (escrito en sí mismo, ~1 página). Modelo de elegancia y meta-definición. |
| **JOSS** | Sistema interactivo de RAND; estándar de buena interacción con el usuario final. |
| **NLS** (Engelbart) | "oN-Line System"; hipertexto, mouse, colaboración. La "augmentación del intelecto". |
| **GRAIL** (RAND) | Interfaz gráfica con tableta y reconocimiento de gestos; manipulación directa, sin modos. |
| **LOGO** (Papert) | Lenguaje para enseñar a programar a chicos (las "tortugas"). Influencia pedagógica clave. |
| **FLEX** (Kay-Cheadle, 1967-69) | Primer intento de PC orientada a objetos; precursor de Smalltalk. |
| **LINC** (Wes Clark, 1962) | Considerada la primera PC real. |
| **ALTO** (Thacker, 1973) | El "Interim Dynabook"; bitmap, ventanas, mouse, Ethernet. Plataforma de Smalltalk. |
| **NoteTaker** (≈1978) | "Laptop" de PARC basada en Intel 8086; corrió Smalltalk en un avión. |
| **Dorado** | "D machine", sucesor rápido del ALTO; usado en la demo a Apple. |
| **OOZE** | Sistema de memoria virtual por objetos de Smalltalk-74/76. |
| **Ethernet** | LAN por conmutación de paquetes inventada en PARC. |
| **Xerox Star** (1981) | Primer producto comercial con GUI (no exitoso). |
| **Apple Lisa / Macintosh** | Llevaron la GUI de PARC al mercado masivo. |
| **bitblt** | Operación de copia de bloques de píxeles; base de los gráficos 2D. |
| **byte-code / VM** | Instrucciones compactas interpretadas por una máquina virtual portable; permiten correr el mismo software en distinto hardware. |

**Personas**

- **Alan Kay** — instigador y diseñador original de Smalltalk; concibió el Dynabook y la computación personal como "medio dinámico".
- **Dan Ingalls** — implementador central; creador de Smalltalk-76; "lo hacés y ya está".
- **Adele Goldberg** — enseñanza con chicos, design templates, documentación, release de Smalltalk-80, luego CEO de ParcPlace.
- **Bob Barton** — diseñó el B5000; "las partes deben tener el mismo poder que el todo".
- **Ivan Sutherland** — Sketchpad; primer jefe de ARPA-IPTO joven.
- **Dave Evans** — mentor de Kay en Utah; "siempre dejá un bit extra".
- **Douglas Engelbart** — NLS, el mouse, la augmentación del intelecto.
- **Seymour Papert / Marvin Minsky** — pedagogía (LOGO, Piaget), modos de pensar la complejidad.
- **Butler Lampson / Chuck Thacker** — propusieron y construyeron el ALTO; ideas de OS, transacciones, "Huffman pobre".
- **Larry Tesler** — miniMOUSE (WYSIWYG modeless), browsers de Smalltalk-76, herencia por delegación; luego Apple.
- **Ted Kaehler** — tortugas OO, TWANG, system tracer, OOZE.
- **Peter Deutsch** — LISP para PDP-1 a los 15; rediseño de la VM en ParcPlace.
- **Bob Taylor** — armó el Computer Science Lab de PARC.

---

## Cierre — 5 ideas para llevarse al final

1. **Smalltalk es una recursión sobre la noción de computadora**: todo es un objeto, los objetos se comunican solo por mensajes, cada uno encapsula estado + proceso (mónada / célula).
2. **Las influencias clave fueron**: el sistema de archivos del B220, el **B5000** (Barton), **Sketchpad** (Sutherland), **Simula** (clases/instancias/herencia), **LISP** (meta-definición), **JOSS/GRAIL/LOGO** (interacción y pedagogía), **FLEX** (Kay) y el **CDL de Fisher** (control). Toda esta tradición venía del clima de **ARPA** y se cristalizó en **Xerox PARC**.
3. **OOP, según Kay, no es "ADT con sintaxis linda"**: su poder real está en cuatro técnicas juntas (estado persistente, polimorfismo, instanciación, métodos-como-metas) y, sobre todo, en el **late binding** y la **protección total** de objetos de primera clase.
4. **Línea evolutiva**: Smalltalk-71 (parser/pattern-matching) → **Smalltalk-72** (primer sistema real, 6 principios, polimorfismo, en el ALTO) → **Smalltalk-76** (intensional, herencia tipo Simula, sintaxis keyword/operador, OOZE, ~180x más rápido) → **Smalltalk-80** (release multivendor vía máquina virtual: Apple/HP/DEC/Tektronix; ASCII, blocks tipo lambda, metaclases).
5. **El meta-relato**: el proyecto era sobre **personas, cultura y visión** (financiar gente y direcciones, contratar ingenuos llenos del sueño, "inventar el futuro"), y sobre el aprendizaje de los chicos como brújula — más que sobre features de un lenguaje. Smalltalk inventó o consolidó la PC, las ventanas superpuestas, la GUI moderna y la OOP, aunque Xerox no supo comercializarlo.
