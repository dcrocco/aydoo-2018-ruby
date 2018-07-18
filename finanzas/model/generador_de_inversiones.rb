require_relative 'inversion_dolares'
require_relative 'plazo_fijo_tradicional'
require_relative 'plazo_fijo_precancelable'


class GeneradorDeInversiones

    class InversionInexistenteError < StandardError
    end

    INVERSIONES = {
      'dol' => lambda{|args| crear_inversion(3, InversionDolares, args)},
      'pft' => lambda{|args| crear_inversion(3, PlazoFijoTradicional, args)},
      'pfp' => lambda{|args| crear_inversion(4, PlazoFijoPrecancelable, args)},
    }

    def self.obtener_inversiones(args)
      inversiones = []
      args.each do |arg|
        parametros_inversiones = arg.split(',', 2)
        validar_entrada(parametros_inversiones)
        inversion = INVERSIONES[parametros_inversiones[0]].(parametros_inversiones[1].split(','))
        inversiones.push(inversion)
      end
      inversiones
    end

    def self.validar_entrada(entrada)
      if entrada.length < 2
        raise ArgumentError.new('El formato de la inversion es invalido')
      end
      unless INVERSIONES.has_key? entrada[0]
        raise InversionInexistenteError
      end
    end

    def self.crear_inversion(cantidad_de_parametros, clase_inversion, args)
      if args.length != cantidad_de_parametros
        raise ArgumentError.new('La cantidad de parametros para crear la inversion es invalida.')
      end
      if args.all? {|arg| !true if Float(arg) rescue false }
        raise ArgumentError.new('El tipo de dato para crear la inversion es invalido.')
      end
      args = args.map{|arg| arg.to_f}
      clase_inversion.new(*args)
    end

    private_class_method :crear_inversion, :validar_entrada
end
