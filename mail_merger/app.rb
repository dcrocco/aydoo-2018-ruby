require "sinatra"
require "json"
require_relative "model/creador"
require_relative "model/sender"

get "/enviar_mail/:variable" do
  Sender.enviar(params[:variable])
  return "Se ha mandado un mail"
end

post '/' do
  entrada = JSON.parse request.body.read
  creador = Creador.new(entrada);

  #puts creador.template;
  return creador.datos.to_json();

end
