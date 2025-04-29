# The Object Recursion Pattern - Bobby Woolf
## Intent
Distribuir el procesamiento de un pedido sobre una estructura medienate la delegación polimórfica. La *Object Recursion* permite que este pedido, repetidas veces, se convierta en partes más sencillas de manejar.

## Also Known As
**Recursive Delegation**

## Motivation
Comparar objetos simples es directo mediante operaciones nativas, pero comparar objetos complejos requiere una estrategia más sofisticada. Un enfoque tradicional consiste en usar un objeto  **Comparer** que descompone ambos objetos en partes simples para compararlas. Sin embargo, este método implica alto acoplamiento, mantenimiento complejo y una exposición innecesaria de la estructura interna de los objetos.

La alternativa orientada a objetos es *delegar la comparación a los propios objetos*. En este enfoque, cada objeto sabe cómo compararse con otro de su tipo, verificando la equivalencia de sus partes relevantes. Si esas partes son complejas, se comparan recursivamente, hasta llegar a componentes simples comparables. Este patrón se conoce como **Object Recursion**, y permite distribuir la lógica de comparación de forma modular y extensible, respetando el encapsulamiento.

Por ejemplo, un objeto *Engine* puede definirse como equivalente a otro si coinciden su tamaño y potencia, los cuales son enteros comparables nativamente. Si los atributos fueran más complejos, ellos mismos aplicarían el mismo principio. Así, se construye una comparación profunda y recursiva sin necesidad de un comparador centralizado.


