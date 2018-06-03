
class Contactos

  attr_accessor :nombre, :apellido, :mail
  
  def initialize(nombre,apellido,mail)
    @nombre = nombre;
    @apellido = apellido;
    @mail = mail;
  end

end
