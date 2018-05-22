require_relative './lechero'
require_relative './tetero'

class HacedorDeTe

    def initialize
      @lechero = Lechero.new
      @tetero = Tetero.new
    end

    def hacer_te_con_leche(vaso)
        @tetero.agregar_te(vaso)
        @lechero.agregar_leche(vaso)
    end

end
