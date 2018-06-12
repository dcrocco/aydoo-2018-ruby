class Fibonacci

  # @param [int] posicion: Posicion de la serie a calcular.
  def calcular(posicion)
    return posicion if ( 0..1 ).include? posicion
    (calcular(posicion-1) + calcular(posicion-2))
  end

  # Devuelve un array con cada valor hasta llegar a la posicion.
  # @param posicion: posicion de la serie
  def obtener_valores(posicion)
    (0..posicion-1).map {|val| calcular(val)}
  end

end