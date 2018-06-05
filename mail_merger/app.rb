require "sinatra"
require "json"
require_relative "model/creador_de_archivo"
require_relative "model/sender"

get "/enviar_mail/:variable" do
  Sender.enviar(params[:variable])
  return "Se ha mandado un mail"
end

post '/' do
  hash_entrada = JSON.parse request.body.read

  #puts hash_entrada["datos"];
  #return hash_entrada["contactos"].to_json()
  sender = Sender.new();
  sender.enviar(hash_entrada);

end
