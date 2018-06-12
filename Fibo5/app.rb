require "sinatra"
require "json"
require_relative "model/fibonacci"
require_relative "model/fibonacci_manager"

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
    fibo_manager = FibonacciManager.new(lista_sucesion, params)
    resultado_lista_procesada = fibo_manager.procesar

    if params['lista_o_sumatoria'].eql? "lista"
      resultado[:fibonacci]["lista"] = resultado_lista_procesada
    elsif params['lista_o_sumatoria'].eql? "sumatoria"
      suma = resultado_lista_procesada.inject(:+)
      resultado[:fibonacci]["sumatoria"] = suma
    end

    resultado.to_json
  end
end