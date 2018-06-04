require_relative "contacto"
require_relative "template"
require_relative "datos"

class Creador

  attr_accessor :template, :contactos, :datos

  def initialize(hash)
    @template = hash["template"];
    @contactos = hash["contactos"];
    @datos = hash["datos"];
  end

  def crear_archivo()

    File.open("../body.txt", "w") do |f|
      f.write(@template)
    end

  end

end
