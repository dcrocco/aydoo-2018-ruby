require_relative "procesador_de_etiquetas"


class ProcesadorDeSum < ProcesadorDeEtiquetas

  def procesar(template, datos)
    suma_en_template = template.scan(/<sum.*?>/)
    suma_en_template.each do |numeros|
      template = template.gsub(numeros, numeros.scan(/\d+/).map(&:to_i).reduce(:+).to_s)
    end
    template
  end

end