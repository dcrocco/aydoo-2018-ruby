@!/bin/bash
# Ejemplos

echo "ejemplo 1, caso simple con 1 etiqueta estatica."
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data1.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "ejemplo 2, esquema incorrecto"
echo "Resultado esperado: http_status:500, {"resultado": "error, entrada incorrecta"}"
curl -X POST -H "Content-Type: application/json" --data @data2_esquema_incorrecto.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "ejemplo 3, caso de varias etiquetas."
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data3.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "Ejemplo 4, etiquetas varias"
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data4.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "Ejemplo 5, date i"
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data5.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "Ejemplo 6, date d"
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data6.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "Ejemplo 7, empty"
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data7.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "Ejemplo 8, sum"
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data8.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "Ejemplo 9, time"
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data9.json http://localhost:4567

echo ""
echo "------------------------------------------------------"

echo "Ejemplo 10, tag usado dos veces"
echo "Resultado esperado: http_status:200, {"resultado": "ok"}"
curl -X POST -H "Content-Type: application/json" --data @data10.json http://localhost:4567
