# A Simple Technique for Handling Multiple Polymorphism

Daniel H. H. Ingalls fue una figura clave en la creación del lenguaje Smalltalk.

Este paper fue presentado en la conferencia OOPSLA (Object-Oriented Programming, Systems, Languages, and Applications) en septiembre de 1986. Ingalls, en ese momento, trabajaba en Apple Computer, Inc.

# Abstract
El paper trata sobre situaciones de múltiple polimorfismo, donde más de un término en una expresión es polimórfico (por ejemplo, tanto el objeto receptor como un argumento pueden tener distintos tipos posibles en tiempo de ejecución). Estas situaciones no están bien resueltas por los lenguajes orientados a objetos convencionales, que solo hacen *simple dispatch* (basado en el tipo del receptor del mensaje)

# Problem 
En estos casos, los programadores suelen recurrir a verificaciones explícitas de tipo (ej. *isMemberOf:*) dentro de métodos para distinguir qué hacer según el tipo del argumento. Esto:

- Rompe la modularidad.

- Aumenta la complejidad del código.

- Lleva a un crecimiento combinatorio del código a medida que aumentan los tipos posibles.

- Va contra los principios que la programación orientada a objetos buscaba resolver.

Ejemplo citado en el paper:
Mostrar objetos gráficos (Rectangle, Oval, etc.) sobre diferentes tipos de puertos (DisplayPort, PrinterPort, etc.) lleva a código como:
Rectangle displayOn: aPort
    aPort *isMemberOf:* DisplayPort ifTrue: [ ... ]
    aPort *isMemberOf:* PrinterPort ifTrue: [ ... ]

Este tipo de código crece rápidamente y es difícil de mantener.

# Solution : Double Dispatch
El autor propone una técnica que preserva la modularidad y permite manejar polimorfismo múltiple usando mecanismos ya disponibles en cualquier lenguaje orientado a objetos:
El envío **encadenado de mensajes (double dispatch)**.
¿Cómo funciona?

1. Cada objeto gráfico implementa un método displayOn: que reenvía el mensaje al puerto, pasando a sí mismo:
    Rectangle displayOn: aPort
    aPort displayRectangle: self

2. Cada puerto implementa un conjunto de métodos específicos para cada tipo de objeto gráfico:
DisplayPort displayRectangle: aRect
  "código para mostrar un rectángulo en un DisplayPort"

PrinterPort displayRectangle: aRect
  "código para mostrar un rectángulo en una impresora"

De este modo, cada uno de los dos objetos polimórficos contribuye a la resolución del comportamiento final mediante un doble despacho de mensajes.

# Ventajas
- Se mantiene la modularidad: no se necesita modificar código existente al agregar nuevos tipos.

- Facilidad de extensión: agregar una nueva clase gráfica implica solo un método displayOn: y nuevas implementaciones en las clases de puerto.

- El código es local a cada clase y no se rompe si se expande el sistema.

- Es aplicable a cualquier lenguaje orientado a objetos.