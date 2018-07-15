require_relative "procesador_de_templates"
require_relative "../excepciones/excepcion_JSON_incompleto"

class ProcesadorDeJson

  def initialize(hash)
    unless ["template", "contactos", "datos"].all? {|s| hash.key? s}
      raise ExcepcionJSONIncompleto, 'Datos faltantes para procesar'
    end
    @template = hash["template"]
    @contactos = hash["contactos"]
    @datos = hash["datos"]
  end

  def procesar(indice)
    procesador_de_templates = ProcesadorDeTemplates.new
    template_procesado = procesador_de_templates.procesar_template(@template, @contactos[indice])
    procesador_de_templates.procesar_template(template_procesado, @datos)
  end

end
