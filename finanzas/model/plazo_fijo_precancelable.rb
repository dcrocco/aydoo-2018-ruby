require_relative 'plazo_fijo_tradicional'

class PlazoFijoPrecancelable < PlazoFijoTradicional

  def initialize(plazo_inicial, plazo_real, interes, monto)
    super(monto, plazo_inicial, interes)
    if plazo_real > plazo_inicial
      raise PlazoInvalidoError
    end
    @plazo_real = plazo_real
  end

  def calcular_ganancia
    monto = super
    if @plazo_inicial > @plazo_real
      monto /= 2
    end
    monto
  end

end