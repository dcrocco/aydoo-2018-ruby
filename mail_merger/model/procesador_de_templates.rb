
class ProcesadorDeTemplates

  def obtener_pais(template, datos)
    pais = datos["pais"] ? datos["pais"] : "argentina"
    template.gsub('<empty(pais, argentina)>', pais)
  end

  def obtener_suma(template, datos)
    suma_en_template = template.scan(/<sum.*?>/)
    suma_en_template.each do |numeros|
      template = template.gsub(numeros, numeros.scan(/\d+/).map(&:to_i).reduce(:+).to_s)
    end
    template
  end

  def initialize
    @etiquetas_especiales = {
        "<date:i>" => -> (template, datos) {template.gsub("<date:i>", Date.today.to_s)},
        "<date:d>" => -> (template, datos) {template.gsub("<date:d>", Date.today.strftime('%d-%m-%Y'))},
        "<empty(pais, argentina)>" => method(:obtener_pais),
        "<sum(monto1, monto2)>" => method(:obtener_suma),
    }
  end

  # Reemplaza el contenido de los tags del template (palabras entre <>) por su valor resultante tomado del hash 'datos'
  # o, en los casos especiales (Contenidos en el initialize), por su respectiva funcion
  def procesar_template(template, datos)
    template = procesar_etiquetas_especiales(template, datos)
    template.scan(/<.*?>/).each do |value|
      if datos[value[1, value.length - 2]] then template = template.gsub(value, datos[value[1, value.length - 2]]) end
    end
    template
  end

  private
  def procesar_etiquetas_especiales(template, datos)
    @etiquetas_especiales.each do |key, value|
      template = @etiquetas_especiales[key].(template, datos)
    end
    template
  end

end
