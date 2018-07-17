require_relative 'inversion_dolares'
require_relative 'inversion_plazo_fijo_tradicional'

class GeneradorDeInversiones

    INVERSIONES = {
      'dol' => lambda{|args| InversionDolares.new(args[0].to_f, args[1].to_f, args[2].to_f)},
      'pft' => lambda{|args| InversionPlazoFijoTradicional.new(args[0].to_f, args[1].to_f, args[2].to_f)}
    }

    def self.obtener_inversiones(args)
      inversiones = []
      args.each do |arg|
        parametros_inversiones = arg.split(',', 2)
        inversiones.push(INVERSIONES[parametros_inversiones[0]].(parametros_inversiones[1].split(',')))
      end
      inversiones
    end

end
