class FibonacciImpar

  def initialize(lista_sucesion)
    @lista_sucesion = lista_sucesion
  end

  def procesar
    @lista_sucesion.select(&:odd?).reject{|x| x <= 0}
  end

end