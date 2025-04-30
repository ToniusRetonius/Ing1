# The Object Recursion Pattern - Bobby Woolf
## Intent
Distribuir el procesamiento de un pedido sobre una estructura medienate la delegación polimórfica. La *Object Recursion* permite que este pedido, repetidas veces, se convierta en partes más sencillas de manejar.

## Also Known As
**Recursive Delegation**

## Motivation
Comparar objetos simples es directo mediante operaciones nativas, pero comparar objetos complejos requiere una estrategia más sofisticada. Un enfoque tradicional consiste en usar un objeto  **Comparer** que descompone ambos objetos en partes simples para compararlas. Sin embargo, este método implica alto acoplamiento, mantenimiento complejo y una exposición innecesaria de la estructura interna de los objetos.

La alternativa orientada a objetos es *delegar la comparación a los propios objetos*. En este enfoque, cada objeto sabe cómo compararse con otro de su tipo, verificando la equivalencia de sus partes relevantes. Si esas partes son complejas, se comparan recursivamente, hasta llegar a componentes simples comparables. Este patrón se conoce como **Object Recursion**, y permite distribuir la lógica de comparación de forma modular y extensible, respetando el encapsulamiento.

Por ejemplo, un objeto *Engine* puede definirse como equivalente a otro si coinciden su tamaño y potencia, los cuales son enteros comparables nativamente. Si los atributos fueran más complejos, ellos mismos aplicarían el mismo principio. Así, se construye una comparación profunda y recursiva sin necesidad de un comparador centralizado.

![Diagrama](https://github.com/ToniusRetonius/Ing1/blob/main/Papers/11/diagrama%201.png)
![Diagrama](https://github.com/ToniusRetonius/Ing1/blob/main/Papers/11/diagrama%202.png)

## Keys
Un sistema que utiliza el patrón *Object Recursion* presenta las siguientes características esenciales:

- Dos clases polimórficas: una maneja el mensaje de forma recursiva y la otra lo procesa directamente sin recursión.

- Un mensaje iniciador, generalmente enviado desde una tercera clase no polimórfica con respecto a las anteriores, que da comienzo al proceso recursivo.

## Applicability 
Aplica el patrón Object Recursion en sistemas con estructuras enlazadas cuando:

- Se debe pasar un mensaje a través de la estructura sin conocer de antemano su destino final.

- Es necesario difundir un mensaje a todos los nodos de una parte de la estructura.

- Se desea distribuir la responsabilidad de un comportamiento entre múltiples objetos dentro de dicha estructura.

## Structure
![Structure](https://github.com/ToniusRetonius/Ing1/blob/main/Papers/11/structure.png)

## Participants
En el patrón Object Recursion, intervienen los siguientes participantes:

- **Initiator** (*Cliente*): Es quien inicia la solicitud mediante un mensaje como makeRequest(). Generalmente no es una subclase de Handler, y su mensaje es distinto del que los manejadores usan (handleRequest()).

- **Handler** (*Comparable*): Define el tipo de objetos que pueden manejar las solicitudes iniciadas por el cliente. Actúa como interfaz común para los objetos que participan en la recursión.

- **Recurser** (*Engine*): Es un tipo específico de Handler que mantiene una referencia a uno o más sucesores. Maneja la solicitud delegándola a sus sucesores, pudiendo ejecutar lógica adicional antes o después de dicha delegación. Un Recurser puede, en otros contextos, actuar como terminador.

- **Terminator** (*Integer*): Concluye el procesamiento de la solicitud implementándola completamente sin delegarla. También puede funcionar como Recurser en solicitudes distintas.

## Collaboration
En el patrón Object Recursion, la colaboración entre los participantes sigue un flujo claro: el Initiator inicia una solicitud pidiéndole a un Handler que la procese. Si el Handler es un Recurser, este realiza el trabajo necesario y luego delega la solicitud a uno de sus sucesores (también Handler). Tras recibir el resultado del sucesor, puede complementarlo con lógica adicional, ejecutada antes o después de la delegación. Si tiene múltiples sucesores, puede delegar a cada uno de ellos de forma secuencial o incluso asincrónica. En cambio, si el Handler es un Terminator, procesa la solicitud completamente por sí mismo, sin delegarla, y devuelve el resultado correspondiente.

## Consequences
El uso del patrón Object Recursion ofrece varias ventajas significativas. En primer lugar, permite *distributed processing*, ya que la solicitud se reparte entre múltiples objetos Handler organizados de la forma más adecuada para cumplir con la tarea. Además, brinda *responsibility flexibility*, puesto que el Initiator no necesita conocer la cantidad, organización o lógica interna de los Handlers; simplemente realiza la solicitud y deja que el sistema la resuelva. Esta organización puede incluso modificarse dinámicamente en tiempo de ejecución.

Otra ventaja es la *role flexibility*: un mismo Handler puede comportarse como Recurser en una solicitud y como Terminator en otra, según el contexto. Por último, mejora la *encapsulación*, ya que cada objeto maneja internamente cómo debe procesarse la solicitud.

No obstante, este patrón también presenta una desventaja: aumento de la *programming complexity*. La recursión, tanto procedural como orientada a objetos, puede ser difícil de entender y mantener, y su uso excesivo puede complicar el diseño del sistema.

## Implementation
Al implementar el patrón de Recursión de Objetos, se deben considerar dos aspectos importantes:

- *Separated initiator type*: El método Initiator.makeRequest() no debe ser polimórfico con Recursor.handleRequest(). Si todos los remitentes de un método son implementadores del mismo mensaje, y no existe un método externo no polimórfico que inicie la recursión, esos métodos pueden eliminarse sin afectar el programa.

- *Defining the succesor*: El Recurser necesita uno o más sucesores, pero el Terminator no. Aunque el Terminator herede el enlace al sucesor, lo ignora en sus métodos. Si todos sus métodos ignoran el sucesor, el valor puede ser nulo y el enlace no es necesario.

## Sample Code
Todos los objetos, por más complejo que sea, se compone de objetos simples (primitivas). Las comparaciones entre primitivas son directas y por tanto, actuarán como caso base de la recursión. 
El ejemplo plantea el caso de un objeto que representa la guía telefónica donde se almacena su nombre y número. En este escenario la recursión tiene dos niveles porque *DirectoryEntry.equals()* llama a
*PersonName.equals()*, que llama a *String.equals().* 
Como se ve a continuación:
![]()