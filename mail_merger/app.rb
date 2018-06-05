require "sinatra"
require "json"
require_relative "model/creador_de_archivo"
require_relative "model/sender"

post '/' do

    begin
      hash_entrada = JSON.parse(request.body.read);
      sender = Sender.new();
      sender.enviar(hash_entrada);
      status 200;
    rescue
        return "Hubo un problema, por favor intentelo de nuevo"
    end
end
