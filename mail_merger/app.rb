require "sinatra"
require "json"
require_relative "model/creador"

post '/' do
  entrada = JSON.parse request.body.read
  creador = Creador.new(entrada);

  #puts creador.template;
  return creador.datos.to_json();

end
