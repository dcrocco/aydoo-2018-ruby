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
      p hash_entrada
      sender.enviar(hash_entrada)
      status 200
    rescue
        return "Hubo un problema, por favor intentelo de nuevo"
    end
end
