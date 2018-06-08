require_relative "procesador_de_etiquetas"


class ProcesadorDeDatos < ProcesadorDeEtiquetas

  def procesar(template, datos)
    template.scan(/<.*?>/).each do |value|
      if datos[value[1, value.length - 2]] then template = template.gsub(value, datos[value[1, value.length - 2]]) end
    end
    template
  end

end