require_relative 'inversion_dolares'
require_relative 'plazo_fijo_tradicional'
require_relative 'plazo_fijo_precancelable'


class GeneradorDeInversiones

    class InversionInexistenteError < StandardError
    end

    INVERSIONES = {
      'dol' => lambda{|args| InversionDolares.new(args[0].to_f, args[1].to_f, args[2].to_f)},
      'pft' => lambda{|args| PlazoFijoTradicional.new(args[0].to_f, args[1].to_f, args[2].to_f)},
      'pfp' => lambda{|args| PlazoFijoPrecancelable.new(args[0].to_f, args[1].to_f, args[2].to_f, args[3].to_f)},
    }

    INVERSIONES = {
      'dol' => lambda{|args| InversionDolares.new(args[0].to_f, args[1].to_f, args[2].to_f)},
      'pft' => lambda{|args| PlazoFijoTradicional.new(args[0].to_f, args[1].to_f, args[2].to_f)},
      'pfp' => lambda{|args| PlazoFijoPrecancelable.new(args[0].to_f, args[1].to_f, args[2].to_f, args[3].to_f)},
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

end
