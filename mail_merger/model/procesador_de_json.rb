require_relative "procesador_de_templates"

class ProcesadorDeJson

  attr_accessor :template, :contactos, :datos

  def initialize(hash)
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

