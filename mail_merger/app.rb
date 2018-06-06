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
    rescue
        status 500
        {"resultado" => "entrada incorrecta"}.to_json
    end
end
