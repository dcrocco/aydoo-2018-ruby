Servicio web que permite calcular la serie de Fibonacci.

`_/fibonacci/<N>[/lista|/sumatoria][?sentido=directo|inverso][&solo=pares|impares]_`

Donde:

- \<N> es un número entero que define el límite de la sucesión 
- /lista define que el resultado debe mostrar la lista de elementos de la sucesión y es excluyente de /sumatoria
- /sumatoria define que el resultado debe mostrar la suma de la lista de elementos de la sucesión y es excluyente de /lista
- El parámetro opcional sentido define si debe mostrarse los elementos de la sucesión en sentido directo o inverso
- El parámetro opcional solo define si debe considerarse solo los números pares o impares

En el caso que no se envíen opciones válidas el sistema devolverá:

`{"error": "Opción no válida"}`

Ejemplos de uso:

>/fibonacci/5/lista 

`{ "fibonacci": { "limite": 5, "lista": [0, 1, 1, 2, 3] } }`
>/fibonacci/5/sumatoria

`{ "fibonacci": { "limite": 5, "sumatoria": 7 } }`
>/fibonacci/5/lista?sentido=inverso

`{ "fibonacci": { "limite": 5, "lista": [3, 2, 1, 1, 0] } }`
>/fibonacci/8/lista?solo=pares

`{ "fibonacci": { "limite": 8, "lista": [2, 8] } }`
