# Polymorphic Hierarchy
*Bobby Woolf* es un ingeniero de software especializado en arquitectura de software empresarial integración de sistemas y cloud. 
Escribió este paper en mayo del 1996.
Él comenta que muchas de las funciones que escribe no son muy originales, ya que incluyen muchos getters, setters, métodos de inicialización y otros que simplemente implementan comportamientos ya definidos en una superclase. Sin embargo, destaca que estos métodos repetitivos, especialmente los que subimplementan métodos de una superclase, son fundamentales para el uso efectivo del polimorfismo.
Cuando se usan de forma consistente y deliberada, los métodos polimórficos permiten crear clases polimórficas, lo que a su vez da lugar a jerarquías polimórficas. El autor introduce el concepto de “Template Class”.

## Reusing Method Descriptions
Acá hace uso el método *printOn:* como ejemplo para ilustrar cómo subimplementa métodos de superclases. En VisualWorks, *printString* se implementa en la clase *Object* usando *printOn:*, el cual es un método genérico. Él lo subimplementa en sus propias clases para personalizar la salida, añadiendo detalles sobre la clase y la instancia.

En lugar de volver a escribir comentarios extensos, simplemente documenta su implementación con algo como “See superimplementor”, porque su método básicamente hace lo mismo que el de la superclase. 

Además, señala que su implementación está en el mismo protocolo de métodos (“printing”) que el original. Esto refuerza la idea de que su método tiene el mismo propósito, y que las subimplementaciones deben mantenerse coherentes con el uso y la documentación del método padre.

## One defining implementor
Cuando el autor escribe todos los métodos que responden a un mismo mensaje en una jerarquía de clases, solo comenta la implementación principal, que usualmente está en la superclase. Aunque esta implementación puede ser muy simple o genérica (como devolver self, lanzar un error *subclassResponsibility*, o aplicar un valor por defecto), es la que define el propósito del mensaje para toda la jerarquía.

Por eso, las subimplementaciones no necesitan una nueva descripción detallada, ya que deben seguir el mismo propósito. El autor simplemente escribe: “See superimplementor”.

Este enfoque también se aplica a métodos encadenados con nombres similares, como:

- *Object>>changed* llama a changed:

- *changed:* llama a *changed:with:*

Una vez que entiendes *changed:with:*, los otros métodos son variantes que usan valores por defecto. Por eso, solo se comenta el más completo, y los otros tienen descripciones como “See changed:” o “See changed:with:”.

## Anatomy of a Method Description
Qué tipo de comentarios vale la pena incluir en la descripción de un método?

- Evitar repetir el nombre del método en la descripción. Por ejemplo, si el método se llama productCode, no tiene sentido escribir “Devuelve el código del producto”, porque es obvio. Si el método es simplemente un getter o setter, prefiere usar descripciones como: “Getter” o “Setter”, ya que no hay mucho más que decir si se entiende lo que hace la variable.

- Describir el propósito general del método en lugar de comentar línea por línea. Si hay código raro o difícil de entender, no lo explica con un comentario críptico. En su lugar, lo extrae a un nuevo método con un nombre descriptivo, y el comentario que habría escrito se convierte en la descripción de ese nuevo método.

## Purpose and implementation details
Cómo estructura sus descripciones de métodos dividiéndolas en dos partes:
1. Propósito (Purpose)

- Describe qué hace el método.

- Se redacta como: "Si envías este mensaje a este objeto, esto es lo que pasará..." Ejemplos:

    - “Ordena los elementos del receptor.”

    - “Lee el siguiente ítem y lo devuelve.”

    - “Devuelve si el receptor contiene errores.”

- Es reutilizable: todos los métodos que implementan el mismo mensaje en una jerarquía deben tener el mismo propósito.
→ Por eso, solo se documenta el propósito en la superclase, y las subclases escriben: “See superimplementor.”

2. Detalles de implementación (Implementation Details)

- Explican cómo se hace lo que el método hace.

- Es opcional, y solo se incluye si el código tiene algo raro, poco intuitivo o específico que vale la pena explicar.

- No es reutilizable: cada implementación puede (y debe) tener sus propios detalles.

## Description Reuse for Polymorphism
Al principio, *Woolf* veía las clases como unidades aisladas y elegía superclases solo para heredar funcionalidad. Con el tiempo, entendió que las clases deben pensarse en jerarquías, donde cada clase depende del contexto que aportan sus superclases. Ahora diseña subclases considerando cómo se diferencian de sus superclases. Estas últimas definen qué debe hacerse, mientras que las subclases implementan cómo hacerlo. Por ejemplo, en la jerarquía Collection, la clase base define las operaciones generales, pero cada subclase las implementa según su estructura interna (lista, hash, etc.). Para mantener coherencia, toda subimplementación debe conservar el mismo propósito que el método original de la superclase, aunque su implementación sea distinta.

## Purpose is polymorphic
Cuando todos los métodos de una jerarquía tienen el mismo propósito, son polimórficos, y así también lo es la jerarquía entera. Esto permite que otros objetos usen cualquier instancia de esa jerarquía indistintamente, ya que todas se comportan igual. Por ejemplo, si un objeto Employee tiene una lista de tareas (toDoList), no importa si es una OrderedCollection o una SortedCollection; mientras sigan cumpliendo los mismos métodos (add:, remove:, size, first), pueden intercambiarse sin problemas. La implementación concreta puede definirse después, sin afectar la lógica general del sistema.

## Defining polymorphism
El autor amplía la definición tradicional de polimorfismo. No basta con que dos métodos tengan el mismo nombre; deben también comportarse igual: aceptar los mismos parámetros, provocar los mismos efectos y devolver el mismo tipo de resultado. Por ejemplo, value y value: pueden tener muchos implementadores, pero no siempre son polimórficos, ya que su comportamiento cambia según la clase (en un ValueModel son accesores; en un Block, son evaluadores).

Del mismo modo, dos clases son polimórficas si entienden los mismos mensajes y sus métodos correspondientes son también polimórficos. Aunque no compartan toda la interfaz, pueden compartir una interfaz central (core interface), que permite que se usen indistintamente en ciertos contextos mientras esa interfaz común sea respetada.

## Making a Hierarchy Polymorphic
En esta parte explica cómo el hábito de comentar los métodos con “See superimplementor” lo llevó a pensar y programar de forma más polimórfica, haciendo sus jerarquías más reutilizables, flexibles y fáciles de entender. Sin embargo, surgen problemas cuando no hay un superimplementor: si dos clases hermanas tienen métodos con el mismo propósito pero no comparten una jerarquía, eso indica que falta una clase abstracta común. En estos casos, la solución es crear una superclase abstracta que defina el comportamiento común (el método con su propósito y una implementación por defecto), y hacer que las clases concretas hereden de ella. Así se formaliza el polimorfismo y se evita la duplicación.

## The Template Class Pattern
El autor introduce el concepto de Template Class, una clase abstracta que define la interfaz común para una jerarquía de clases polimórficas, dejando los detalles de implementación a las subclases. Esta idea es similar al patrón Template Method, pero a nivel de clase. Mientras el Template Method define la estructura de un método, el Template Class define el comportamiento general de una familia de clases. El resultado es una jerarquía coherente y completamente polimórfica.

## The ValueModel hierarchy
La jerarquía ValueModel en VisualWorks es un ejemplo claro de una jerarquía polimórfica. La clase ValueModel define una interfaz común con mensajes como value, value: y onChangeSend:to:. Las subclases (como ValueHolder, AspectAdaptor, y TypeConverter) implementan estos mensajes según sus propias necesidades, pero respetan la misma interfaz.

Esto permite que el código colaborador (como los widgets de interfaz gráfica) use cualquier instancia de la jerarquía sin importar la subclase específica, gracias al polimorfismo a nivel de clase.

Otros ejemplos clásicos de jerarquías polimórficas incluyen Collection, Magnitude, Number, Boolean, y String, cuya popularidad se debe en gran parte a lo fácil que resulta usarlas justamente por ser polimórficas.