require_relative "procesador_de_etiquetas"


class ProcesadorDeFechas < ProcesadorDeEtiquetas

  def procesar(template, datos)
    template.gsub("<date:d>", Date.today.strftime('%d-%m-%Y'))
  end

end