require_relative 'fibonacci_inversor'
require_relative 'fibonacci_par'
require_relative 'fibonacci_impar'
require_relative 'errors'

class FibonacciManager

  attr_reader :lista_sucesion

  def initialize(lista_sucesion, params)
    @lista_sucesion = lista_sucesion
    @params = params
  end

  def procesar
    procesadores = obtener_procesadores
    procesadores.each do |procesador|
      @lista_sucesion = procesador.procesar(@lista_sucesion)
    end
    @lista_sucesion
  end

  private
  def obtener_procesadores
    procesadores = []
    if @params.key? 'sentido'
      if @params['sentido'].eql? 'inverso'
        procesadores.push(FibonacciInversor.new)
      elsif !@params['sentido'].eql? 'directo'
        raise ArgumentSentidoError, "Parámetro inválido para argumento 'sentido'"
      end
    end
    if @params.key? 'solo'
      if @params['solo'].eql? 'pares'
        procesadores.push(FibonacciPar.new)
      elsif @params['solo'].eql? 'impares'
          procesadores.push(FibonacciImpar.new)
      else
        raise ArgumentSoloError, "Parámetro inválido para argumento 'solo'"
      end
    end
    procesadores
  end

end