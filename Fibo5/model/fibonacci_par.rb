class FibonacciPar

  def procesar(lista_sucesion)
    lista_sucesion.select(&:even?).reject{|x| x <= 0}
  end

end