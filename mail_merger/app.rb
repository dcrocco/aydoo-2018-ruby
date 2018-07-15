require "sinatra"
require "json"
require_relative "model/enviador_de_mails"

configure do
  set :bind, '0.0.0.0'
end

post '/' do
    begin
      entrada = request.body.read
      if(entrada == "")
        raise ExcepcionArchivoNoEncontrado
      end
      hash_entrada = JSON.parse(entrada)
      sender = Enviador.new
      sender.enviar(hash_entrada)
      status 200
      {"resultado" => "ok"}.to_json
    rescue JSON::ParserError => e
      status 400
      {"resultado" => "La estructura del JSON pasado es incorrecta"}.to_json
    rescue ExcepcionJSONIncompleto => e
      status 400
      {"resultado" => "Error en el JSON pasado"}.to_json
    rescue ExcepcionServidorSMTPNoLevantado => e
      status 500
      {"resultado" => "Error, el servidor SMTP esta caido"}.to_json
    rescue Encoding::CompatibilityError => e
      status 400
      {"resultado" => "Error de compatibilidad"}.to_json
    rescue ExcepcionArchivoNoEncontrado
      status 400
      {"resultado" => "El archivo no pudo encontrarse"}.to_json
    end
end
