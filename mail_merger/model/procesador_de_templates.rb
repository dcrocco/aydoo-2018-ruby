
class ProcesadorDeTemplates

  def initialize
    @etiquetas_especiales = {
        "<date:i>" => Date.today.to_s,
        "<date:d>" => Date.today.strftime('%d-%m-%Y')
    }
  end

  # Reemplaza el contenido de los tags del template (palabras entre <>) por su valor resultante tomado del hash 'datos'
  # o, en los casos especiales (Contenidos en el initialize), por su respectiva funcion
  def procesar_template(template, datos)
    template = procesar_etiquetas_especiales(template)
    template.scan(/<.*?>/).each do |value|
      if datos[value[1, value.length - 2]] then template = template.gsub(value, datos[value[1, value.length - 2]]) end
    end
    template
  end

  private
  def procesar_etiquetas_especiales(template)
    @etiquetas_especiales.each do |key, value|
      template = template.gsub(key, value)
    end
    template
  end

end