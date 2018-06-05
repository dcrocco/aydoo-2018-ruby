require_relative "contacto"
require_relative "template"
require_relative "datos"
require_relative "procesador_de_templates"

class CreadorDeArchivo

  attr_accessor :template, :contactos, :datos

  def initialize(hash)
    @template = hash["template"];
    @contactos = hash["contactos"];
    @datos = hash["datos"];
  end

  def crear_archivo(numero_de_contacto)
    procesador_de_templates = ProcesadorDeTemplates.new();
    template_procesado = procesador_de_templates.procesar_template(@template, @datos);
    template_procesado = template_procesado.gsub("<nombre>", @contactos[numero_de_contacto]["nombre"])
    File.open("body.txt", "w") do |f|
      f.write(template_procesado);
    end

  end

end
