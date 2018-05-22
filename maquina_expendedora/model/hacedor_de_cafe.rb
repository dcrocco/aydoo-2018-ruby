require_relative './lechero'
require_relative './cafetero'

class HacedorDeCafe

    def initialize
      @cafetero = Cafetero.new
      @lechero = Lechero.new
    end

    def hacer_cafe_con_leche(vaso)
      @cafetero.agregar_cafe(vaso)
      @lechero.agregar_leche(vaso)
    end

end
