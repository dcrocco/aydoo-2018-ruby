require_relative 'inversion_dolares'
require_relative 'inversion_plazo_fijo_tradicional'
require_relative 'calculador_de_impuesto'

class Inversiones

    def initialize(args)
      args = args[0].split(' ')
      @persona = args[0]
      @inversiones = obtener_inversiones(args[1..args.length])
    end

    def calcular_ganancia
      ganancia = 0
      @inversiones.each do |inversion|
        ganancia += inversion.calcular_ganancia
      end
      ganancia
    end

    def calcular_impuesto
      CalculadorDeImpuesto.calcular_impuesto(@persona, calcular_ganancia)
    end

    private
    def obtener_inversiones(args)
      inversiones = []
      args.each do |arg|
        parametros_inversiones = arg.split(',', 2)
        inversion = obtener_inversion(parametros_inversiones[0], parametros_inversiones[1])
        inversiones.push(inversion)
      end
      @inversiones = inversiones
    end

    private
    def obtener_inversion(tipo, valores)
      if tipo == 'dol'
        return InversionDolares.new(valores)
      end
      else if tipo == 'pft'
        return InversionPlazoFijoTradicional.new(valores)
      end
    end

end
