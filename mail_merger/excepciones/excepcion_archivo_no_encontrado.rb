class ExcepcionArchivoNoEncontrado < Exception

    def initialize(msg='El archivo JSON no fue encontrado')
        super
    end

end
