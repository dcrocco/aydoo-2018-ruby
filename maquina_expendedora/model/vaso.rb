class Vaso

  attr_accessor :cantidad_de_azucar
  attr_accessor :tiene_cafe
  attr_accessor :tiene_te
  attr_accessor :tiene_leche

  def initialize
    self.cantidad_de_azucar = 0
  end

  def tiene_cafe?
    self.tiene_cafe
  end

  def tiene_te?
    self.tiene_te
  end

  def tiene_leche?
    self.tiene_leche
  end

  def tiene_azucar?
    self.cantidad_de_azucar > 0
  end

end
