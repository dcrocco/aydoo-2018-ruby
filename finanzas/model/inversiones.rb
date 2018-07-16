require_relative 'inversion_dolares'

class Inversiones

    def self.obtener_inversiones(args)
      inversiones = []
      args = args[0].split(' ')
      individuo_inversion = args[0]
      args[1..args.length].each do |arg|
        parametros_inversiones = arg.split(',', 2)
        inversion = obtener_inversion(parametros_inversiones[0], individuo_inversion, parametros_inversiones[1])
        inversiones.push(inversion)
      end
      inversiones
    end

    def self.obtener_inversion(tipo, individuo_inversion, args)
      if tipo == 'dol'
        InversionDolares.new(individuo_inversion, args)
      end
    end

    def obtener_inversion_dolares(individuo_inversion, valores)
      InversionDolares.new(individuo_inversion, valores)
    end

end
