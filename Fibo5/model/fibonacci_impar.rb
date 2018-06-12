class FibonacciImpar

  def procesar(lista_sucesion)
    lista_sucesion.select(&:odd?).reject{|x| x <= 0}
  end

end