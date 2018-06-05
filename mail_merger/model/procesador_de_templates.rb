
class ProcesadorDeTemplates

  def procesar_template(template, datos)

    template.scan(/<.*?>/).each do |value|
      template = template.gsub(value, datos[value[1, value.length - 2]])
    end
    template

  end

end