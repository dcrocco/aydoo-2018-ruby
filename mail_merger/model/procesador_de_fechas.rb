
class ProcesadorDeFechas

  def procesar(template, datos)
    template.gsub("<date:d>", Date.today.strftime('%d-%m-%Y'))
  end

end
