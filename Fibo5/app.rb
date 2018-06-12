require "sinatra"
require "json"
require_relative "model/fibonacci"

configure do
  set :bind, '0.0.0.0'
end

get '/fibonacci/:limite' do

  begin
    sucesion = params['limite']
    {"fibonacci": { "limite": sucesion.to_i }}.to_json
  end

end

get '/fibonacci/:limite/lista' do

  begin
    sucesion = params['limite'].to_i
    fibonacci = Fibonacci.new
    lista_sucesion = fibonacci.obtener_valores(sucesion)
    {"fibonacci": { "limite": sucesion, "lista": lista_sucesion }}.to_json
  end

end