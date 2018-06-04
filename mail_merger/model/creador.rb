require_relative "contacto"
require_relative "template"
require_relative "datos"

class Creador

  attr_accessor :template, :contactos, :datos

  def initialize(json_de_entrada)
    @template = json_de_entrada["template"];
    @contactos = json_de_entrada["contactos"];
    @datos = json_de_entrada["datos"];
  end

end
