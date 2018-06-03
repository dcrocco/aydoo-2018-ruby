require "sinatra"
require "json"


post '/' do
  entrada = JSON.parse request.body.read
  contactos = entrada["contactos"][0];
  return contactos.to_json();
end
