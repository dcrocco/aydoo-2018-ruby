class FibonacciPar

  def initialize(lista_sucesion)
    @lista_sucesion = lista_sucesion
  end

  def procesar
    @lista_sucesion.select(&:even?).reject{|x| x <= 0}
  end

end