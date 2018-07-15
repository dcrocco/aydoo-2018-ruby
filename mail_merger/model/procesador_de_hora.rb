
class ProcesadorDeHoras

  def procesar(template, datos)
    template.gsub("<time>", Time.now.strftime('%H:%M'))
  end

end
