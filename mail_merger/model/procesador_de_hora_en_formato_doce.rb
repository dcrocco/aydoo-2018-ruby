require_relative "procesador_de_etiquetas"

class ProcesadorDeHorasEnFormatoDoce < ProcesadorDeEtiquetas

  def procesar(template, datos)
    template.gsub("<time:12>", Time.now.strftime('%I:%M %p'))
  end

end
