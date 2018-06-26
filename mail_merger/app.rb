require "sinatra"
require "json"
require_relative "model/sender"

configure do
  set :bind, '0.0.0.0'
end

post '/' do
    begin
      hash_entrada = JSON.parse(request.body.read)
      sender = Sender.new
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
      #raise Errno::ECONNREFUSED;
    rescue Encoding::CompatibilityError => e
      {"resultado" => "Error CompatibilityError"}.to_json
    end
end
