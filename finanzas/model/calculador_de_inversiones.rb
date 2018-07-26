require_relative 'inversion_dolares'
require_relative 'plazo_fijo_tradicional'
require_relative 'generador_de_inversiones'
require_relative 'calculador_impuesto_empresa'
require_relative 'calculador_impuesto_individuo'


class CalculadorDeInversiones

    class CalculadorDeImpuestoInvalidoError < StandardError
    end

    CALCULADORES_DE_IMPUESTOS = {
      'ind' => CalculadorImpuestoIndividuo,
      'emp' => CalculadorImpuestoEmpresa
    }

    def initialize(args)
      validar_entrada(args)
      @calculador_de_impuesto = CALCULADORES_DE_IMPUESTOS[args[0]]
      @inversiones = GeneradorDeInversiones.obtener_inversiones(args[1..args.length])
    end

    def calcular_valores_inversion
      ganancia = calcular_ganancia
      {:ganancia => ganancia, :impuesto => calcular_impuesto(ganancia)}
    end

    private
    def calcular_ganancia
      ganancia = 0
      @inversiones.each do |inversion|
        ganancia += inversion.calcular_ganancia
      end
      ganancia
    end

    private
    def calcular_impuesto(ganancia)
      @calculador_de_impuesto.calcular_impuesto(ganancia)
    end

    private
    def validar_entrada(args)
      if args.length < 2
        raise ArgumentError.new('No se encontro una inversion para calcular')
      end
      unless CALCULADORES_DE_IMPUESTOS.has_key? args[0]
        raise CalculadorDeImpuestoInvalidoError
      end
    end

end
