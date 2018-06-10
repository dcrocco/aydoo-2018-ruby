require_relative "procesador_de_etiquetas"

class ProcesadorDeHoras < ProcesadorDeEtiquetas

  def procesar(template, datos)
    template.gsub("<time>", Time.now.strftime('%H:%M').to_s)
  end

end
