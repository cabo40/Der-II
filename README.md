# Repositorio del curso de Derivados II
## Objetivo
Este repositorio tiene como objetivo coleccionar la implementación de los métodos vistos en clase y lograr obtener una calculadora suficientemente robusta de productos financieros dado un mercado determinado.

## Tareas anteriores
 - Clonar el repositorio, escribir en el archivo "Alumnos" las iniciales de su nombre y hacer pull
  - Correr en el código de Black-Scholes.R la función de precio analítico y la de precio por simulación y comparar para distintos Strikes y maturities
  
## Tarea actual
 - Hacer una función para calcular el precio analítico de una opción digital call (put) y comparar con el precio aproximado utilizando call spreads (put spreads)
 - Usar método Vanna-Volga para aproximar el smile de volatilidad dados los inputs de http://www.fabiomercurio.it/consistentfxsmile.pdf pag. 11
 - Dada una superficie de precios call, obtener la función de vol local 

## Tarea pendiente
- Implementar bootstrapping de curvas
- Implementar funciones para valuar forward Libor, FRA y SWAP.
