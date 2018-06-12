require_relative './hacedor_de_cafe'
require_relative  './hacedor_de_te'
require_relative './azucarero'

class MaquinaExpendedoraDeBebidas

  def initialize
    @hacedor_de_cafe = HacedorDeCafe.new
    @hacedor_de_te = HacedorDeTe.new
    @azucarero = Azucarero.new
  end

  def hacer_cafe_con_leche_con_n_de_azucar(vaso, cantidad_azucar)
    @hacedor_de_cafe.hacer_cafe_con_leche(vaso)
    @azucarero.poner_azucar(vaso, cantidad_azucar)
  end

  def hacer_te_con_leche_con_n_de_azucar(vaso, cantidad_azucar)
    @hacedor_de_te.hacer_te_con_leche(vaso)
    @azucarero.poner_azucar(vaso, cantidad_azucar)
  end

end
