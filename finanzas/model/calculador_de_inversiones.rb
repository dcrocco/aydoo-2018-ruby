require_relative 'inversion_dolares'
require_relative 'plazo_fijo_tradicional'
require_relative 'generador_de_inversiones'
require_relative 'calculador_impuesto_empresa'
require_relative 'calculador_impuesto_individuo'


class CalculadorDeInversiones

    CALCULADORES_DE_IMPUESTOS = {
      'ind' => CalculadorImpuestoIndividuo,
      'emp' => CalculadorImpuestoEmpresa
    }

    def initialize(args)
      args = args[0].split(' ')
      @impuesto = CALCULADORES_DE_IMPUESTOS[args[0]]
      @inversiones = GeneradorDeInversiones.obtener_inversiones(args[1..args.length])
    end

    def calcular_ganancia
      ganancia = 0
      @inversiones.each do |inversion|
        ganancia += inversion.calcular_ganancia
      end
      ganancia
    end

    def calcular_impuesto
      @impuesto.calcular_impuesto(calcular_ganancia)
    end

end
