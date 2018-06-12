require_relative 'fibonacci_inversor'
require_relative 'fibonacci_par'
require_relative 'fibonacci_impar'


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

  def obtener_procesadores
    procesadores = []
    if @params['sentido'].eql? 'inverso'
      procesadores.push(FibonacciInversor.new)
    end
    if @params.key? 'solo'
      if @params['solo'].eql? 'pares'
        procesadores.push(FibonacciPar.new)
      elsif @params['solo'].eql? 'impares'
          procesadores.push(FibonacciImpar.new)
      end
    end
    procesadores
  end

end