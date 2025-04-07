# Principios de Diseño de Smalltalk 
Escrito por Daniel H. Ingalls que fue uno de los creadores de SmallTalk. Fue iseñador principal de Smalltalk-76 y Smalltalk-80. También inventó el bit blit (bit block transfer), una técnica  de gráficos en que permitió interfaces gráficas más eficientes y rápidas.
(Publicado originalmente en Byte, Agosto de 1981, dedicada a Smalltalk)

El proyecto Smalltalk busca brindar herramientas computacionales que apoyen el potencial creativo de las personas, combinando el mejor hardware disponible con una visión centrada en el individuo creativo.

Se enfoca en dos aspectos clave:

- Lenguaje de descripción: un lenguaje de programación que conecta los modelos mentales humanos con los de la máquina.

- Lenguaje de interacción: una interfaz de usuario que facilita la comunicación natural entre humanos y computadoras.

El desarrollo del sistema sigue un ciclo iterativo, similar al método científico:

- Crear una aplicación en el sistema actual (observación)

- Rediseñar el lenguaje según lo aprendido (teoría)

- Construir un nuevo sistema con ese rediseño (predicción verificada)

El Smalltalk-80 es la quinta iteración de este proceso.

### Dominio Personal
Si un sistema es para servir al espíritu creativo, debe ser completamente entendible para un individuo solitario.

### Buen Diseño
Un sistema debería ser construido con un mínimo conjunto de partes no modificables; esas partes debieran ser tan generales como sea posible; y todas las partes del sistema deberían estar mantenidas en un esquema uniforme.

## Lenguaje
Al crear un lenguaje de programación, es útil inspirarse en cómo piensan y se comunican los humanos, ya que estos procesos han evolucionado durante millones de años. En lugar de adaptar la mente humana a la computadora, es más efectivo hacer que el sistema computacional sea compatible con la mente.

La comunicación ocurre en dos niveles:

- Explícita: el contenido directo de un mensaje (palabras, gestos).

- Implícita: las suposiciones y experiencias compartidas entre los interlocutores.

Esto también aplica a la interacción entre una persona y una computadora. Para diseñar un lenguaje computacional eficaz, es esencial considerar tanto:

- Los modelos mentales internos del usuario.

- Como los medios de interacción externos del sistema.

El lenguaje, entonces, debe funcionar como un puente entre el pensamiento humano y el procesamiento computacional, permitiendo que las ideas fluyan con naturalidad entre ambos.

### Propósito del lenguaje
Proveer un esquema para la comunicación.

En la comunicación humana, gran parte del significado surge del contexto compartido. El lenguaje natural depende en gran medida de estas referencias implícitas.

Lo mismo aplica a las computadoras:
Estas pueden verse como participantes en una conversación.

- Su "cuerpo" es la interfaz (pantalla, teclado, mouse), que permite mostrar y recibir información.

- Su "mente" está compuesta por la memoria y el procesamiento interno.

Diseñar un lenguaje de computadora implica considerar ambos niveles de comunicación. Un buen lenguaje computacional debe ser consciente del contexto del usuario, no solo de los comandos directos.

### Alcance
El diseño de un lenguaje para usar computadoras debe tratar con modelos internos, medios externos, y con la interacción entre ellos tanto en el humano como en la computadora.


## Ojetos que se Comunican
La mente humana percibe un universo lleno de experiencias. Para interactuar con él (no solo observarlo), necesitamos diferenciar elementos dentro de ese universo: identificar objetos.

Este proceso de diferenciación implica:

- Separar un objeto del resto del entorno.

- Reconocerlo como algo distinto (por ejemplo, "esa silla").

Para facilitar la comunicación y el pensamiento, asignamos un nombre o identificador al objeto, lo que nos permite referirnos a él fácilmente en el futuro, sin repetir todo el proceso de identificación.

En consecuencia, un sistema de computación debe:

- Proveer modelos de objetos que reflejen este proceso mental.

- Permitir que los objetos tengan identidad, nombre y forma de comunicación.

### Objetos: 
Un lenguaje de computación debe soportar el concepto de "objeto" y proveer una manera uniforme de referirse a los objetos de universo.

Smalltalk implementa un modelo de memoria orientado a objetos para todo el sistema.

- Cada objeto recibe un identificador único (un entero), lo que permite una referenciación uniforme.

- Esta uniformidad facilita que las variables puedan apuntar a cualquier tipo de valor, manteniendo una estructura simple a nivel de memoria.

- Los objetos se crean al evaluar expresiones y pueden circular libremente por el sistema gracias a esta forma de referencia.

- No es necesario almacenar los objetos dentro de los procedimientos: basta con referenciarlos.

- Cuando ya no existen referencias a un objeto, este se elimina automáticamente y su memoria se libera.


### Administración del Almacenamiento
Para ser auténticamente "Orientado a Objetos" un sistema debe proveer administración automática del almacenamiento.
Una forma de evaluar si un lenguaje está bien diseñado es observar si sus programas reflejan naturalmente lo que hacen.
Si los códigos están llenos de instrucciones de administración de memoria, entonces el lenguaje no está alineado con cómo piensan los humanos.

Imaginá tener que avisarle a alguien cada vez que querés hablar o terminar una conversación...
Eso sería antinatural, y lo mismo ocurre con los lenguajes de programación que no manejan bien la memoria.

En la mente humana:

- Cada objeto mental tiene su propio almacenamiento y procesamiento.

- Vive su "propia vida" sin depender de que otro le administre el espacio constantemente.

### Mensajes
La computación debería ser vista como una capacidad intrínseca de los objetos que pueden ser invocados uniformemente enviándoles mensajes.
Así como la gestión manual de memoria ensucia los programas, también lo hace el control externo del comportamiento de los objetos.

Por ejemplo, en muchos lenguajes, sumar 5 a un número implica que el compilador determine el tipo del número y genere el código adecuado.
Pero esto rompe la filosofía orientada a objetos, donde los tipos pueden ser dinámicos e incluso definidos por el usuario.

Una posible solución es usar una rutina general de suma que inspeccione los tipos, pero eso:

- Complica el sistema.

- Obliga a los usuarios novatos a modificar una parte crítica del lenguaje.

- Rompe la encapsulación, ya que los detalles internos de los objetos se dispersan por todo el sistema.

En cambio, Smalltalk resuelve esto elegantemente:

- El número recibe un mensaje que incluye el nombre de la operación (por ejemplo, suma) y los parámetros.

- El objeto decide por sí mismo cómo responder a ese mensaje.

- La única interacción externa válida es el envío de mensajes, porque los objetos deben controlar su propio comportamiento.

### Metáfora Uniforme
Un lenguaje debería ser diseñado alrededor de una metáfora poderosa que pueda ser aplicada uniformemente en todas las áreas.
Existen lenguajes exitosos basados en modelos conceptuales claros:

- LISP → basado en listas enlazadas

- APL → basado en arreglos

- Smalltalk → basado en objetos que se comunican

En todos estos casos, las aplicaciones complejas se construyen siguiendo el mismo modelo que las unidades más simples del sistema.
Especialmente en Smalltalk, la interacción entre objetos simples (como números) es idéntica a la interacción de alto nivel entre el usuario y el sistema.

Cada objeto en Smalltalk:

- Tiene un protocolo de mensajes: un conjunto de mensajes a los que puede responder.

- Tiene un contexto implícito, que incluye almacenamiento local y acceso a información compartida.

## Organización
Una metáfora uniforme (como "todo es un objeto") proporciona un marco coherente para construir sistemas complejos.
Para manejar esa complejidad, es fundamental aplicar principios de organización bien definidos.

A medida que crece la cantidad de componentes en un sistema, también crece la probabilidad de interacciones no deseadas entre ellos.

Por eso, un buen lenguaje de programación debe:

- Limitar esas interdependencias.

- Favorecer una estructura clara, modular y predecible.

- Usar una metáfora común (como en Smalltalk) que permita entender y extender el sistema sin caos.

### Modularidad
Ningún componente en un sistema complejo deberia depender de los detalles internos de
ningún otro componente.

La figura 2 (referida en el texto) muestra que si un sistema tiene N componentes, entonces puede haber hasta N² dependencias entre ellos.
Esto aumenta rápidamente la complejidad y el riesgo de errores en sistemas grandes.

Por eso, es esencial reducir la interdependencia entre componentes.

Smalltalk lo hace así:

- Usa la metáfora de envío de mensajes, lo que:

    - Desacopla la intención (el mensaje enviado) del método que lo ejecuta.

    - Protege el estado interno de los objetos: solo puede accederse a través de mensajes.

Para manejar mejor la complejidad también se agrupan componentes similares:

- En lenguajes tradicionales: se usa tipado de datos.

- En Smalltalk: se usan clases.

Las clases:

- Describen el estado interno de sus objetos.

- Definen el protocolo de mensajes que pueden recibir.

- Contienen los métodos que responden a esos mensajes.

- Los objetos definidos por una clase se llaman instancias.

Incluso las clases mismas son objetos en Smalltalk:
Son instancias de la clase Class, lo cual unifica toda la estructura del lenguaje en la misma lógica de objetos y mensajes.

### Clasificación
Un lenguaje debe proveer un medio para clasificar objetos similares, y para agregar nuevas clases de objetos en pie de igualdad con las clases centrales del sistema.
La clasificación convierte experiencias en conceptos abstractos, como ver una silla y pensar en la idea general de “silla”.

En Smalltalk, las clases permiten construir esas abstracciones y extender el sistema naturalmente.

Ejemplo: En un sistema musical, se pueden crear clases como Nota, Melodía, Partitura, etc., que se usan igual que cualquier clase base.

Si el lenguaje permite usar estos nuevos objetos fácilmente, el usuario los elegirá de forma natural, mejorando la claridad y expresividad del diseño.

### Polimorfismo
Un programa sólo debería especificar el comportamiento esperado de los objetos, no su representación.

n programa no debería depender del tipo exacto de un objeto (como SmallInteger o LargeInteger), sino solo de que responda al protocolo adecuado.

Ejemplo:
En una simulación de tránsito, si todo se basa en el protocolo común de los vehículos, se puede agregar fácilmente un nuevo tipo, como un camión barrecalles, sin modificar el código existente.

Esto permite extensión sin recompilación ni errores, gracias al modelo de mensajes y protocolos compartidos.

### Factorización
Cada componente independiente de un sistema sólo debería aparecer en un sólo lugar.
Factorización significa que cada parte del sistema debería estar definida una sola vez, para:

- Ahorrar tiempo y esfuerzo.

- Facilitar la búsqueda y el uso de componentes.

- Evitar errores por inconsistencias o duplicación.

Smalltalk fomenta esto con herencia:
Las clases heredan comportamiento de otras más generales, hasta llegar a la clase Object.

Ejemplo:
En una simulación de tránsito, StreetSweeper y otros vehículos serían subclases de Vehicle, evitando repetir código y manteniendo el diseño limpio.


### Reaprovechamiento: 
Cuando un sistema está bien factorizado, un gran reaprovechamiento está disponible tanto para los usuarios como para los implementadores.
En Smalltalk, si se define un método como sort en la clase OrderedCollection, todas las secuencias del sistema heredan automáticamente esa capacidad gracias al mecanismo de herencia. Este método puede ser usado tanto para ordenar texto como números, ya que ambos tipos responden al mismo protocolo de comparación.

Ventajas para los implementadores:

- Se reduce la cantidad de primitivas que deben implementarse.

- Por ejemplo, todo el sistema gráfico de Smalltalk se basa en una única operación primitiva.

- Esto permite concentrar los esfuerzos de optimización en pocos puntos clave del sistema.

Este enfoque lleva a la pregunta sobre cuál es el conjunto mínimo de primitivas necesarias para soportar un sistema completo. La respuesta a eso se llama especificación de una máquina virtual.

### Máquina Virtual
Una especificación de máquina virtual establece un marco para la aplicación de tecnología.
La máquina virtual de Smalltalk define tres modelos fundamentales:

- Modelo orientado a objetos para el almacenamiento.

- Modelo orientado a mensajes para el procesamiento.

- Modelo de mapa de bits para la visualización.

Gracias al uso de microcódigo (y potencialmente hardware dedicado), se puede mejorar mucho el rendimiento sin sacrificar las ventajas del diseño del sistema.

## Interfaz al usuario
La interfaz al usuario es un tipo de lenguaje, principalmente visual, y su diseño debe alinearse con la forma en que los humanos perciben y se comunican. Por eso, la estética es clave.

Como toda la capacidad del sistema llega al usuario por esta vía, la flexibilidad también es crucial. Para lograrla, se propone un principio orientado a objetos que sirva como base del diseño 

### Principio Reactivo
Cada componente accesible al usuario debería ser capaz de presentarse de una manera entendible para ser observado y manipulado.
Este principio se cumple bien en el modelo de objetos que se comunican, ya que cada objeto tiene su propio protocolo de mensajes, como un microlenguaje. En la interfaz de usuario, este lenguaje se muestra visualmente y se interactúa mediante teclado y puntero. Sin embargo, los sistemas operativos suelen romper esta coherencia, forzando al programador a trabajar en entornos distintos y más limitados, aunque esto no debería ser necesario.

### Sistema Operativo
Un sistema operativo es una colección de cosas que no encajan dentro de un lenguaje. No debería existir.
el concepto tradicional de sistema operativo desaparece porque sus funciones están integradas directamente en el lenguaje. Por ejemplo:

- Administración de memoria: es automática, sin necesidad de intervención del programador.

- Sistema de archivos: representado por objetos como File y Directory con protocolos de mensajes.

- Pantalla: es un objeto (Form) que se manipula con mensajes gráficos.

- Entrada del usuario: el teclado y otros dispositivos son objetos con mensajes para consultar su estado.

- Acceso a subsistemas: todo subsistema es un objeto más del entorno Smalltalk.

- Debugger: se realiza con objetos como Process, permitiendo inspeccionar y modificar el estado de ejecución.

## Trabajo Futuro
A futuro, se busca mejorar Smalltalk aplicando sus propios principios de diseño. Las principales áreas de desarrollo incluyen:

- Herencia múltiple: superar la limitación actual de herencia jerárquica para permitir una herencia más flexible.

- Formalización de protocolos: definir protocolos de mensajes como objetos compartibles, lo que permitiría tipado formal sin perder polimorfismo.

- Nuevas metáforas cognitivas: identificar aspectos del pensamiento humano aún no reflejados en el lenguaje para enriquecer su modelo.

El texto cierra con una reflexión optimista: aunque el progreso pueda parecer lento, los sistemas se están volviendo más simples y usables. La evolución natural favorecerá a los lenguajes con buen diseño.
