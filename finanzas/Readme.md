Calculador de inversiones
===========================

Permite calcular la ganancia de una inversión y los impuestos a pagar por las ganancias obtenidas.

## Forma de ejecución de la aplicación:

La aplicación debe recibir por parámetros 
1) Si el calculo es para un individuo (ind) o empresa (emp).
2) Los datos de diversas inversiones.
Los parámetros de entrada son de la forma:

    - Plazo fijo tradicional: pft,\<plazo>,\<interes>,\<monto>
    - Plazo fijo precancelable: pfp,<plazo_inicial>,<plazo_real>,\<interes>,\<monto>
    - Dólares: dol,\<monto>,<cotizacion_inicial>,<cotización_final>

El cálculo del impuesto según ganancia será según la siguiente tabla:

 Ganancia        | Impuesto para empresas           | Impuesto para individuos |
| ------------- |-------------| -----|
| g < $20.000   | 0 | 0 |
| $20.000 <= g < $50.000      | 5%      |   0|
| $50.000 <= g < $100.000      | 10%      |   5%|
| $100.000 <= g < $500.000     | 15%      |   8%|
| $500.000 >= g      | 20%      |   10%|


## Ejemplos de uso
ind dol,1000,20,28
> ganancia: 400 impuesto: 0

emp dol,20000,20,28 pft,90,40,250000
> ganancia: 32657.53 impuesto: 1632.88

finanzas ind pft,365,10,500000 pfp,365,300,40,100000 dol,100000,18,27
> ganancia: 120000 impuesto: 9600

