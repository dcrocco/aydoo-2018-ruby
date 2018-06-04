require "sinatra"
require "json"
require_relative "model/creador"
require_relative "model/sender"

get "/enviar_mail/:variable" do
  Sender.enviar(params[:variable])
  return "Se ha mandado un mail"
end

get '/' do
  hash_entrada = JSON.parse request.body.read
  sender = Sender.new();
  sender.enviar(hash_entrada);

end
