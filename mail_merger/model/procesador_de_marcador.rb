
class ProcesadorDeMarcador

  def procesar(template, datos)
    paises = template.scan(/<empty\(\w+, \w+\)>/)
    paises.each do |pais|
      dato_a_reemplazar = pais.partition('(').last.partition(')').first.partition(', ')
      pais_reemplazado = datos[dato_a_reemplazar[0]] ? datos[dato_a_reemplazar[0]] : dato_a_reemplazar[2]
      template = template.gsub(pais, pais_reemplazado)
    end
    template
  end

end