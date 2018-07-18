class PlazoFijoTradicional < Inversion

  def initialize(plazo, interes, monto)
    super(monto)
    @plazo = plazo
    @interes = interes
  end

  def calcular_ganancia
    ((@plazo / 365) * (@interes / 100) * @monto).round(2)
  end

end