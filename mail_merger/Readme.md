AYDOO TP 2018: MailMerger
=========================

Es una aplicación que permite hacer envíos de mails masivos a partir de una plantilla, un archivo de contactos  y un archivo de datos

El template tiene ciertos placeholders que la aplicación reemplaza por datos obtenidos del archivo de datos al momento de enviar los mails.
Las direcciones a las que deben ser enviados los mails se encuentran en el archivo de contactos.
La aplicación tiene una interface web y otra de línea de comandos.
Soporte de etiquetas especiales:\
**<date:i>**: debe reemplazarse por la fecha actual en formato inverso: AAAA-MM-DD\
**<date:d>**: debe reemplazarse por la fecha actual en formato: DD-MM-AAAA\
**<empty(pais,argentina)>**: si el placeholder “pais” no está definido en el archivo de datos, entonces utilizar el valor “argentina”\
**<sum(monto1, monto2)>**: debe reemplazarse por la suma de los placesholders monto1 y monto2

### _Ejemplos_
https://gitlab.com/aydoo-untref/ejercicios/tree/master/procesador_de_templates

### _Comportamiento esperado_
La aplicación debería enviar el siguiente mail a juanperez@test.com y maria.gonzalez@test.com.
Asunto: Invitación a fiesta de fin de año

Hola Juan,

Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día 5 de diciembre.
Por favor confirmar su participación enviando un mail a fiesta@untref.com.

Sin otro particular.
La dirección

### _Entrada de datos_
Sólo con pasársele un JSON, la aplicación ya podrá mandar los mails, el JSON debe respetar el formato de datos definido en los JSONS de ejemplo

### _Manejo de errores_
Si la petición ha ido bien se devuelve un status 200, mientras que si hay algún error, se levantará le excepción y se devolverá un mensaje diciendo que hubo un problema

## Autores

* **Daniel Crocco**
* **Alan Lamas**
