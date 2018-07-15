
class ProcesadorDeFechasInversas

  def procesar(template, datos)
    template.gsub("<date:i>", Date.today.to_s)
  end

end
