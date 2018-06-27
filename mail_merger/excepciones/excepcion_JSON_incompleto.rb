class ExcepcionJSONIncompleto < Exception

    def initialize(msg='El JSON enviado esta incompleto')
        super
    end

end
