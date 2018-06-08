require_relative "procesador_de_datos"
require_relative "procesador_de_fechas"
require_relative "procesador_de_fechas_inversas"
require_relative "procesador_de_paises"
require_relative "procesador_de_sum"


class ProcesadorDeTemplates

  def initialize
    @procesadores = [
        ProcesadorDeDatos.new,
        ProcesadorDeFechas.new,
        ProcesadorDeFechasInversas.new,
        ProcesadorDePaises.new,
        ProcesadorDeSum.new
    ]
  end

  # Reemplaza el contenido de los tags del template (palabras entre <>) por su valor resultante tomado del hash 'datos'
  # o, en los casos especiales, por su respectiva funcion
  def procesar_template(template, datos)
    template = template
    @procesadores.each do |procesador|
      template = procesador.procesar(template, datos)
    end
    template
  end

end
