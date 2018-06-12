require_relative 'fibonacci_inversor'
require_relative 'fibonacci_par'


class FibonacciManager

  attr_reader :lista_sucesion

  def initialize(lista_sucesion, params)
    @lista_sucesion = lista_sucesion
    @params = params
  end

  def procesar
    if @params['sentido'].eql? 'inverso'
      inversor = FibonacciInversor.new(@lista_sucesion)
      @lista_sucesion = inversor.procesar
    end
    if @params['solo'].eql? 'pares'
      inversor = FibonacciPar.new(@lista_sucesion)
      @lista_sucesion = inversor.procesar
    end
    @lista_sucesion
  end

end