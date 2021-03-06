require_relative "procesador_de_templates"
require_relative "procesador_de_json"
require_relative "../excepciones/excepcion_smtp_no_levantado"
require 'mail'


class Enviador
  attr_accessor :template, :contactos, :datos
  
  def enviar(hash_entrada)
    procesador_de_json = ProcesadorDeJson.new(hash_entrada)
    (0...hash_entrada["contactos"].length).each {|indice|
      body = procesador_de_json.procesar(indice)
      enviar_mail(
          hash_entrada["datos"]["remitente"],
          hash_entrada["contactos"][indice]["mail"],
          hash_entrada["datos"]["asunto"],
          body
      )
    }
  end

  private
  def validar_valores_mail(from, to, subject, body)
    if from.nil? || to.nil? || subject.nil? || body.nil?
        raise ExcepcionJSONIncompleto, 'Datos faltantes para enviar el mail'
    end
  end

  private
  def enviar_mail(from, to, subject, body)

    validar_valores_mail(from, to, subject, body)
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end
    begin
      Mail.deliver do
        from from
        to to
        subject subject
        body body
      end
    rescue Errno::ECONNREFUSED
      raise ExcepcionServidorSMTPNoLevantado;
    end
  end

end
