# Self : The Power of Simplicity
**David Ungar** y **Richard V Heng** fueron los creadores de *Self* en *Sun Microsystems* y este paper fue escrito por uno de ellos (*David*) y **Randall B Smith** en 1987.
Self es un lenguaje orientado a objetos para fomentar el **exploratory programming** (el proceso se centra en "explorar" el problema mientras se desarrolla el código, experimentando y aprendiendo de forma incremental). Se basa en un número simple y concreto de ideas : **Prototipos, Slots** y **Comportamiento**. Los *prototipos* combinan herencia y *instantiation* para promover un espacio de trabajo simple y flexible. Los *slots* unifican las variables y los proc en un sólo construct. La particularidad de *Self* es que no diferencia entre estado y comportamiento.

## Intro
Como *SmallTalk-80, Self* está pensado para impulsar el **exploratory programming** y por ello incluye el *runtime typing* y *Automatic Storage Reclamation*(básicamente una manera automática de liberar y gestionar el espacio de memoria). Se distigue de *SmallTalk* ya que *Self* no utiliza ni clases ni variables sino que usa **Prototypes** para la creación de objetos. Los objetos pueden acceder a su información a través de mensajes a **self** y de ahí toma el nombre este lenguaje. 


## Principios de diseño 
### Messages-at-the-Bottom
La operación fundamental es el pasaje de mensajes. No hay variables sólo *slots* que contienen los objetos que retornan a sí mismos.

### Occam's Razor
Economía conceptual. El diseño de *Self* omite clases y variables. Cualquier objeto puede realizar el rol de instancia o mismo ser un espacio de memoria compartida. No hay distinción entre *acceder a una variable y pasar un mensaje*.
Así como en *SmallTalk*, el *language kernel* no tiene estructuras de control. En cambio, hace uso del **Polimorfismo y Closures** para manejar el control arbitrario dentro del lenguaje. 
A diferencia de *SmallTlak*, los objetos en *Self* como también los closures y los proc, todos se representan como **prototypes of activation record**, esto es, como prototipos del registro de activación, la estructura de datos que se utiliza para almacenar la información relacionada con la ejecucición de un proc. La pila es normalmente lo que se utiliza para guarda cada uno de estos registros, es decir, se llama a una función, se crea su registro de activación y se apila.
Por otra parte, los proc y los closures también guardan sus variables y guardan la info de su entorno.

### Concreteness
En un lenguaje basado en clases, un objeto se crea *instanciando* un plan dentro de su clase. En un lenguaje basado en prototipos como *Self*, un objeto se crea clonando (copiando) un prototipo. En *Self*, cualquier objeto puede ser clonado.

## Prototypes : Blending Classes and Instances
En *Smalltalk*, a diferencia de lenguajes como C++ o Simula, todo es un objeto y cada objeto contiene un puntero a su clase, que describe su formato y comportamiento. En *Self*, todo también es un objeto, pero en lugar de un puntero a la clase, un objeto de *Self* contiene **slots** con nombres que pueden almacenar tanto estado como comportamiento. Si un objeto recibe un mensaje y no tiene una **slot** coincidente, la búsqueda continúa a través de su puntero a su *parent*, implementando así la herencia. La herencia en *Self* permite que los objetos compartan comportamientos, lo que facilita cambiar el comportamiento de varios objetos con una sola modificación. Por ejemplo, un objeto de tipo *point* tendría **slots** para sus características específicas (x e y), mientras que su *parent* almacenaría el comportamiento compartido, como las operaciones de suma o resta.

## Comparing Prototypes and Classes 
### Simpler relationships
Los prototipos pueden simplificar las relaciones entre objetos. En un lenguaje basado en clases, existen dos relaciones clave: la relación **"es un"** (que indica que un objeto es una instancia de una clase) y la relación **"tipo de"** (que indica que la clase de un objeto es una subclase de la clase de otro objeto). En *Self*, solo existe una relación: **"hereda de"**, que describe cómo los objetos comparten comportamiento y estado.

### Creation by copying
La creación de nuevos objetos a partir de prototipos se logra mediante una operación simple: la **copia**, usando la metáfora biológica del clonaje. En cambio, la creación de objetos a partir de clases se realiza mediante **instanciación**, que incluye la interpretación de la información de formato de una clase.

### Examples of preexisting modules
Los prototipos son más concretos que las clases porque son ejemplos de objetos en lugar de descripciones de formato e inicialización. Estos ejemplos pueden ayudar a los usuarios a reutilizar módulos, ya que los hacen más fáciles de entender. En un sistema basado en prototipos, el usuario puede examinar un representante típico, en lugar de tener que interpretar su descripción.

### Support for one-of-a-kind objects
*Self* ofrece un marco que facilita la inclusión de objetos únicos con su propio comportamiento. Dado que cada objeto tiene *slots* con nombres, y estas pueden almacenar tanto estado como comportamiento, cualquier objeto puede tener *slots* o comportamientos únicos. Los sistemas basados en clases están diseñados para situaciones donde hay muchos objetos con el mismo comportamiento, pero no ofrecen soporte lingüístico para que un objeto tenga su propio comportamiento único, y crear una clase garantizando una única instancia es complicado. *Self* no sufre de estas desventajas, ya que cualquier objeto puede personalizarse con su propio comportamiento, sin necesidad de crear una "instancia" separada.

### Elimination of meta-regress
En los sistemas basados en clases, ningún objeto es autosuficiente; otro objeto (su clase) es necesario para expresar su estructura y comportamiento. Esto lleva a una regresión infinita de metaclases: un punto es una instancia de la clase Punto, que es una instancia de la metaclase Punto, que es una instancia de la metametaclase Punto, y así sucesivamente. En los sistemas basados en prototipos, un objeto puede incluir su propio comportamiento, sin necesidad de otro objeto para darle vida, eliminando así esta **meta-regresión**.

Sin embargo, los sistemas basados en prototipos sin herencia tendrían un problema: cada objeto incluiría todo su comportamiento, lo que se parecería más al mundo real, pero perdería una de las principales ventajas de las computadoras, que es la capacidad de hacer cambios globales modificando el comportamiento compartido. Cuando se introduce la herencia, la tendencia natural es hacer que el prototipo sea el mismo objeto que contiene el comportamiento de ese tipo de objeto. Pero esto requeriría dos formas de crear objetos: una para hacer un objeto que sea descendiente de un prototipo y otra para copiar un objeto que no sea un prototipo. 

*Self* resuelve esto combinando prototipos e herencia: coloca el comportamiento compartido en un objeto "padre" que es común para todos, incluidos los prototipos, evitando así la creación de objetos especiales y manteniendo la flexibilidad de los prototipos.


## Blenidng state and behaviour
En *Self*, no se accede directamente a las variables; en su lugar, los objetos envían mensajes para acceder a los datos almacenados en *slots* nombrados. Por ejemplo, para obtener el valor de "x" de un punto, el objeto envía el mensaje “x” a sí mismo, y el sistema evalúa el valor almacenado en la *slot* correspondiente.

Para modificar el valor de "x", en lugar de usar una asignación como en otros lenguajes, el objeto envía un mensaje como “x: 17” para actualizar el valor de la *slot* "x" a 17. Esto simplifica el acceso y la modificación del estado, permitiendo que el código sea tan simple como en Smalltalk, pero con la flexibilidad de mensajes.

En lenguajes orientados a objetos tradicionales, el acceso a variables y el envío de mensajes son operaciones separadas, lo que diluye el modelo de paso de mensajes y reduce su potencia. Además, la inclusión de variables hace más difícil reemplazar una variable con un resultado calculado, ya que puede haber código en una superclase que acceda directamente a la variable.

Finalmente, el acceso a variables en lenguajes basados en clases requiere reglas de alcance, lo que agrega complejidad, mientras que Self simplifica este proceso al no tener las restricciones de variables tradicionales.

## Closures
La comunidad de Scheme ha obtenido excelentes resultados utilizando **closures** (o expresiones lambda) como base para las estructuras de control. La experiencia con los bloques de Smalltalk también respalda esto, ya que los **closures** proporcionan una metáfora poderosa y fácil de usar para que los usuarios exploten y definan sus propias estructuras de control. Además, esta capacidad es crucial para cualquier lenguaje que soporte tipos de datos abstractos definidos por el usuario.

### Local Variables
En *Self*, los *closures* y procedimientos usan los *slots* de los objetos para almacenar variables locales. A diferencia de Smalltalk, donde los registros de activación se crean con cada método, en *Self* los objetos funcionan como prototipos de registros de activación. Estos prototipos se copian y se invocan para ejecutar la subrutina o bloque, y los variables locales se asignan reservando *slots* en el prototipo, que pueden ser inicializadas con cualquier valor, incluyendo métodos privados y *closures*.
### Environment link
En *Self*, los *closures* usan un enlace al "padre" para resolver referencias a variables fuera de su alcance. Este enlace permite buscar en alcances exteriores si un *slot* no se encuentra en el alcance actual. Para métodos, el enlace se establece en el receptor del mensaje, y para bloques, en el registro de activación del método que los contiene.

Además, el operando implícito "self" en *Self* comienza la búsqueda de mensajes con el registro de activación actual, pero el receptor es el mismo que el receptor del mensaje, a diferencia de "super" en Smalltalk, que comienza la búsqueda en la superclase.
## Speculation : Where is Self headed ?
### Behaviorism
### Computation viewed as refinement
### Parents viewed as shared parts
