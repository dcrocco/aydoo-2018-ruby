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


get '/fibonacci/:limite/:lista_o_sumatoria' do
  begin
    sucesion = params['limite'].to_i
    fibonacci = Fibonacci.new
    resultado = {"fibonacci": { "limite": sucesion}}
    lista_sucesion = fibonacci.obtener_valores(sucesion)
    if params['lista_o_sumatoria'].eql? "lista"
      resultado[:fibonacci]["lista"] = lista_sucesion
    elsif params['lista_o_sumatoria'].eql? "sumatoria"
      suma = lista_sucesion.inject(:+)
      resultado[:fibonacci]["sumatoria"] = suma
    else
      status 400
      resultado = {"error": "Opción no válida"}
    end
    resultado.to_json
  end
end