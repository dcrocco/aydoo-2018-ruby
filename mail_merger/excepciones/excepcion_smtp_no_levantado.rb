
class ExcepcionServidorSMTPNoLevantado < Exception

    def initialize(msg='El servidor de mail SMTP no esta levantado')
        super
    end

end
