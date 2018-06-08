require_relative "procesador_de_etiquetas"


class ProcesadorDeFechasInversas < ProcesadorDeEtiquetas

  def procesar(template, datos)
    template.gsub("<date:i>", Date.today.to_s)
  end

end