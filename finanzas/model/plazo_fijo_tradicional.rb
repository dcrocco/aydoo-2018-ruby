class PlazoFijoTradicional < Inversion

  class PlazoInvalidoError < StandardError
  end
  class InteresInvalidoError < StandardError
  end

  def initialize(monto, plazo_inicial, interes)
    super(monto)
    if plazo_inicial <= 0
      raise PlazoInvalidoError
    end
    if interes <= 0
      raise InteresInvalidoError
    end
    @plazo_inicial = plazo_inicial
    @interes = interes
  end

  def calcular_ganancia
    ((@plazo_inicial / 365) * (@interes / 100) * @monto).round(2)
  end

end