
class ProcesadorDeTemplates

  def procesar_template(template, datos)

    template.scan(/<.*?>/).each do |value|
      if datos[value[1, value.length - 2]] then template = template.gsub(value, datos[value[1, value.length - 2]]) end
    end
    template

  end

end