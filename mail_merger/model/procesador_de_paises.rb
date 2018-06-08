require_relative "procesador_de_etiquetas"


class ProcesadorDePaises < ProcesadorDeEtiquetas

  def procesar(template, datos)
    pais = datos["pais"] ? datos["pais"] : "argentina"
    template.gsub('<empty(pais, argentina)>', pais)
  end

end