class PlazoFijoTradicional

  def initialize(plazo, interes, monto)
    @plazo = plazo
    @interes = interes
    @monto = monto
  end

  def calcular_ganancia
    ((@plazo / 365) * (@interes / 100) * @monto).round(2)
  end

end