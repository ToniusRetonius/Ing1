# The Null Object Pattern - Bobby Woolf
Bobby Woolf escribe en 1996 este paper con el intento de : *"Provide a surrogate for another object that shares the same interface but does nothing. The Null Object encapsulates the implementation decisions of how to “do nothing” and hides those details from its collaborators."*

## Motivation
A veces una clase necesita un colaborador, aunque no requiera que este haga algo. Aun así, quiere tratar del mismo modo a colaboradores activos e inactivos. Por ejemplo, en el paradigma *Model-View-Controller (MVC)* de Smalltalk-80, una View usa un Controller para obtener entrada del usuario. Esto corresponde al *Strategy Pattern*. Sin embargo, una vista puede ser de solo lectura y no necesitar un controlador, aunque su implementación sí lo espera. 
- El *Model-View-Controller (MVC)* es un patrón que promovía una separación de responsabilidades de forma de lograr un código más modular. El *controlador* interpreta la entrada del usuario y la envía al modelo. El *modelo* actualiza sus datos. La *vista*, que está observando al modelo, se actualiza para reflejar los nuevos datos.
 
Si algunos objetos de la clase necesitan controlador y otros no, la clase igualmente debe ser una subclase de *View* y, por lo tanto, tener un controlador. Usar *nil* como controlador no es una buena solución, ya que implicaría agregar código condicional constantemente para evitar errores de mensajes no entendidos por *nil*.

Una alternativa es un controlador en modo solo lectura, pero eso implica lógica innecesaria si siempre será de solo lectura. La mejor opción es un controlador que no haga nada: una subclase especial llamada **NoController**, que *implementa toda la interfaz de Controller pero sin realizar acciones*. Por ejemplo, responde false a *isControlWanted* y retorna self en *startUp*.

Esto ilustra el *Null Object Pattern*, que define *cómo crear una clase que encapsula el comportamiento de “no hacer nada”, ocultando esa complejidad y haciéndola reutilizable*. La clave del patrón es una clase abstracta con la interfaz común, de la cual el *Null Object* es una subclase.


## Applicability - Cuándo usar el Null Object Pattern

1. *Cuando un objeto necesita un colaborador*  
   El patrón no crea esta colaboración, sino que aprovecha una ya existente.

2. *Cuando algunos colaboradores deben no hacer nada*  
   Es útil cuando ciertas instancias del colaborador no deben realizar ninguna acción.

3. *Cuando se quiere que el cliente no distinga entre un colaborador real y uno que no hace nada*  
   Así, el cliente no tiene que verificar si es `nil` u otro valor especial.

4. *Cuando se desea reutilizar el comportamiento de “no hacer nada”*  
   Esto garantiza consistencia entre diferentes clientes que necesitan ese comportamiento.

5. *Cuando todo el comportamiento que podría ser “no hacer nada” está encapsulado en la clase colaboradora*  
   Si parte del comportamiento es “no hacer nada”, lo más probable es que la mayoría o todo lo sea.

## Structure
![Structure](/home/tonius/Desktop/Compu/Ingeniería del Software I/Papers/10/structure.png)

## Participants

1. *Client (View)*  
   Requiere un colaborador.

2. *AbstractObject (Controller)*  
   - Declara la interfaz del colaborador del Client.  
   - Implementa el comportamiento por defecto común a todas las clases, cuando es apropiado.

3. *RealObject (TextController)*  
   - Define una subclase concreta de AbstractObject cuyas instancias proveen el comportamiento que el Client espera.

4. *NullObject (NoController)*  
   - Proporciona una interfaz idéntica a la de AbstractObject, permitiendo que pueda sustituirse por un objeto real.  
   - Implementa esa interfaz sin realizar acciones. El significado de “no hacer nada” depende del comportamiento esperado por el Client.  
   - Si existen múltiples formas de “no hacer nada”, pueden requerirse varias clases NullObject.

## Collaborations

*Los clientes usan la interfaz de la clase AbstractObject para interactuar con sus colaboradores.*  
Si el receptor es un *RealObject*, la solicitud se maneja proporcionando un comportamiento real.  
Si el receptor es un *NullObject*, la solicitud se maneja no haciendo nada o devolviendo un resultado nulo.

## Consequences

1. *Define jerarquías de clases que incluyen objetos reales y null objects*  
   Se pueden usar null objects en lugar de objetos reales cuando se espera que no hagan nada. El código del cliente puede trabajar con ambos indistintamente.

2. *Simplifica el código del cliente*  
   Los clientes tratan por igual a colaboradores reales y null, sin necesidad de comprobar si son `null`, evitando código condicional extra.

3. *Encapsula el código de “no hacer nada” dentro del null object*  
   Este código es fácil de ubicar, claro en su diferencia con otras clases, y puede evitar variables `null`, usando constantes o evitando su uso por completo.

4. *Facilita la reutilización del comportamiento de “no hacer nada”*  
   Varios clientes que necesitan este comportamiento lo implementan de forma consistente. Si se necesita modificar, se cambia en un solo lugar.

5. *Dificulta distribuir o mezclar el comportamiento de “no hacer nada” en objetos colaboradores reales*  
   Para reutilizarlo, las clases deben delegar dicho comportamiento en una clase que pueda ser un null object.

6. *Puede requerir crear una clase NullObject para cada nueva clase AbstractObject*.

7. *Puede ser difícil de implementar si los distintos clientes no están de acuerdo en qué significa “no hacer nada”*.

8. *Siempre actúa como un objeto que no hace nada*  
   Un Null Object no se convierte en un objeto real.


## Implementation

1. *Null Object como Singleton*  
   Como no tiene estado, puede reutilizarse una sola instancia en lugar de crear varias iguales.
    - El *Singleton Pattern* asegura que una clase tenga una única instancia y proporciona un punto de acceso global a ella.

2. *Instancia especial de un Real Object*  
   Para evitar la explosión de clases, el null object puede ser una instancia especial de RealObject, con variables en valores nulos que provoquen un comportamiento nulo.

3. *Clientes no coinciden en el null behaviour*  
   Si distintos clientes esperan distintos “no hacer nada”, se necesitan múltiples clases NullObject o variables configurables. También puede usarse el Flyweight Pattern si se comparte comportamiento común y se parametriza lo variable.

    - El **Flyweight Pattern** es utilizado para optimizar el uso de la memoria al compartir objetos que son costosos de crear y mantener. En lugar de crear múltiples instancias de un objeto, el Flyweight reutiliza instancias compartidas, separando el estado *intrínseco* (que puede ser compartido) del estado *extrínseco* (que depende del contexto y puede cambiar).

4. *Transformación a Real Object*  
   Un Null Object no se convierte en un objeto real. Si se requiere esa transformación, se debe usar el Proxy Pattern.
    
    - El **Proxy Pattern** proporciona un sustituto o representante de otro objeto. Controla el acceso al objeto real, permitiendo que se realicen tareas como control de acceso, pereza de inicialización, o agregar funcionalidad adicional sin alterar el objeto original. 


5. *Null Object no es Proxy*  
   Aunque similares, el Proxy accede y puede convertirse en el objeto real. El Null Object directamente reemplaza al objeto real y nunca cambia su comportamiento.

6. *Null Object como special Strategy*  
   Puede ser una implementación del Strategy Pattern que simplemente no hace nada. Por ejemplo, `NoController` como estrategia que ignora la entrada del usuario.

    - El  **Strategy Pattern** define una familia de algoritmos, encapsula cada uno y los hace intercambiables. Permite que el algoritmo varíe independientemente de los clientes que lo utilicen. Es útil cuando hay diferentes formas de realizar una tarea y se quiere permitir que el comportamiento de un objeto se cambie dinámicamente en runtime.

7. *Null Object como special State*  
   Puede ser una implementación de un estado en el State Pattern que hace poco o nada. Por ejemplo, el estado de usuario no logueado solo permite iniciar sesión.

    - El  **State Pattern** permite que un objeto cambie su comportamiento cuando cambia su estado interno. El objeto parecerá cambiar su clase, pero realmente está cambiando su comportamiento según el estado en el que se encuentre. 

8. *Null Object no es un mixin*  
   Es una clase concreta, no diseñada para mezclar comportamiento, sino para ser un colaborador completo que puede ser sustituido cuando se desea un comportamiento nulo.

## Sample Code

El ejemplo muestra la implementación del patrón **Null Object** en la clase `NullScope` dentro de la jerarquía `NameScope` en VisualWorks Smalltalk. En esta jerarquía, `NameScope` define las operaciones para buscar variables, manejar variables no declaradas e iterar sobre ellas. 
La forma en la que estoy mensajes pasan de un scope a otro es un ejemplo del *Chain of Responsibility Pattern* 
    - El *Chain of Responsibility Pattern* es un patrón de diseño de comportamiento que permite pasar una solicitud a lo largo de una cadena de objetos receptores hasta que uno de ellos maneje la solicitud.

Existen tres clases principales: 
1. **NameScope**: Es la clase base con métodos como `variableAt:from:`, `undeclared:from:`, y `namesAndValuesDo:`.
2. **StaticScope** y **LocalScope**: Subclases de `NameScope` que implementan de forma concreta los métodos definidos por `NameScope`.
3. **NullScope**: Representa el scope más externo y no contiene variables. Implementa `variableAt:from:` devolviendo `nil` y `namesAndValuesDo:` sin hacer nada.

Lo interesante de `NullScope` es cómo maneja `undeclared:from:`. Mientras que las clases `StaticScope` y `LocalScope` delegan la solicitud a su `outerScope`, `NullScope` se encarga de buscar y devolver la variable desde un diccionario de variables no declaradas. Si la variable no está allí, se agrega al diccionario.

La implementación de `NullScope` encapsula el comportamiento "no hacer nada", evitando que se introduzcan pruebas especiales en las clases reales y facilitando la reutilización del comportamiento en diferentes partes del sistema.

## Known Uses

### NoController
**NoController**, la clase de Null Object en el ejemplo motivador, es una clase en la jerarquía de Controladores de VisualWorks Smalltalk.

### NullDragMode
**NullDragMode** es una clase en la jerarquía de DragMode de VisualWorks Smalltalk. Un DragMode se utiliza para implementar *placement and dragging*  de visuales en el pintor de ventanas. Las subclases representan diferentes formas de *dragging*. Un ejemplo de una subclase es **CornerDragMode**, que representa el arrastre de un control de tamaño de una visual. Un **NullDragMode** es el contrapunto a **CornerDragMode** y representa un intento de redimensionar una visual que no puede redimensionarse (como una etiqueta de texto). El método `dragObject:startingAt:inController:` de **NullDragMode** utiliza un bloque vacío que no hace nada. 

### NullInputManager
**NullInputManager** es una clase en la jerarquía de InputManager de VisualWorks Smalltalk. Un InputManager proporciona una interfaz estándar para eventos de la plataforma que pueden afectar el manejo de *internationalized input*. **NullInputManager** representa plataformas que no soportan internacionalización. Sus métodos no hacen nada o muy poco, mientras que los métodos de su contraparte **X11InputManager** realizan trabajo real. 
    - Esto es un ejemplo del *Adapter Pattern*. Este actúa como un intermediario que convierte la interfaz de una clase en otra que el cliente espera, permitiendo que interactúen sin que el cliente necesite modificar las clases originales.

### NullScope
**NullScope** es una clase en la jerarquía NameScope de VisualWorks Smalltalk. Un **NameScope** representa el alcance de un conjunto particular de variables. **NullScope** representa el alcance más externo, que nunca contiene ninguna variable. Cuando se busca una declaración de variable, cada alcance sigue buscando en su alcance externo hasta que encuentra la declaración o llega a **NullScope**. Este detiene la búsqueda y devuelve que la variable aparentemente no ha sido declarada. **NullScope** se implementa como un Singleton, ya que el sistema nunca necesita más de una instancia. 

### NullLayoutManager
El **LayoutManager** en el Java AWT Toolkit podría beneficiarse de un objeto nulo como **NullLayoutManager**. Si un contenedor no requiere un **LayoutManager**, su variable puede ser establecida en `nil`. Sin embargo, esto obliga a verificar constantemente si la variable es `nil`. Usar un **NullLayoutManager** evitaría estas verificaciones y simplificaría el código. 

### Null_Mutex
**Null_Mutex** es una clase de mecanismo de exclusión mutua en el marco ASX (ADAPTIVE Service eXecutive) implementado en C++. **Null_Mutex** no realiza ninguna acción de bloqueo, ya que su clase está destinada a servicios que siempre se ejecutan en un solo hilo y no necesitan concurrencia. Sus métodos `acquire` y `release` no hacen nada, eliminando la sobrecarga de obtener bloqueos innecesarios. 

### Null Lock
**Null Lock** es un tipo de modo de bloqueo en el sistema de gestión de bases de datos VERSANT. A diferencia de otros tipos de bloqueo (como el bloqueo de escritura o lectura), el **Null Lock** no bloquea otros locks y no puede ser bloqueado por otros, garantizando acceso inmediato al objeto. Aunque no realiza bloqueo real, actúa como si lo hiciera para operaciones que requieren algún tipo de bloqueo. 

### NullIterator
El **NullIterator** es una especialización del patrón **Iterator**. Cada nodo en un árbol puede tener su propio iterador para sus hijos. Los nodos hoja devuelven una instancia de **NullIterator**, que siempre indica que la iteración ha finalizado, ayudando a evitar pruebas especiales al iterar sobre estructuras vacías. 
    - El *Iterator Pattern* proporciona una forma de acceder secuencialmente a los elementos de una colección sin exponer su estructura interna.

### Z-Node
En lenguajes procedurales, los **z-nodes** son nodos ficticios utilizados como el último nodo en una lista enlazada. Un **z-node** se usa como sustituto cuando faltan nodos hijos en un árbol. Los algoritmos de búsqueda pueden omitir los **z-nodes**, ya que cuando se encuentran con un **z-node**, saben que no se encontró el elemento buscado. 

### NULL Handler
El  **Decoupled Reference Pattern** muestra cómo acceder a objetos a través de Handlers para ocultar su ubicación real del cliente. Cuando un cliente solicita un objeto que ya no está disponible, en lugar de hacer que el programa falle, el sistema devuelve un **NULL Handler**. Este Handler actúa como otros Handlers, pero cumple las solicitudes generando excepciones o causando condiciones de error. 
    - El *Decoupled Reference Pattern* desacopla a un cliente del objeto real al que quiere acceder, usando una referencia indirecta o manejador (*handler*).  Esto permite que el cliente no conozca la ubicación, el ciclo de vida, o incluso la existencia concreta del objeto real.
    
## Related Patterns 

- **Singleton**: El `NullObject` suele implementarse como un *Singleton*, ya que no tiene estado y múltiples instancias se comportarían igual.
- **Flyweight**: Cuando varios objetos nulos comparten una implementación común, pueden usar el patrón *Flyweight* para reducir el uso de memoria.
- **Strategy**: El `NullObject` puede ser una estrategia que simplemente no hace nada.
- **State**: También puede representar un estado en el que el objeto no debe realizar ninguna acción.
- **Iterator**: Puede actuar como un iterador especial que no recorre ningún elemento.
- **Adapter**: Un *null adapter* simula adaptar otro objeto, pero en realidad no adapta nada.
- **Exceptional Value**: El `NullObject` es un caso especial de *Exceptional Value*, que representa circunstancias excepcionales de forma pasiva y segura.
    - **Whole Value** define el objeto.  
    - **Exceptional Value** define el comportamiento excepcional del objeto.  
    - **NullObject** es una implementación concreta de un Exceptional Value que **hace nada** en vez de fallar.  
    - **CHECKS Pattern Language** es el marco que agrupa estos conceptos.

