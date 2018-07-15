
class ProcesadorDeHorasEnFormatoDoce

  def procesar(template, datos)
    template.gsub("<time:12>", Time.now.strftime('%I:%M %p'))
  end

end
