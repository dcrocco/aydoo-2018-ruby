require_relative 'inversion_plazo_fijo_tradicional'


class PlazoFijoPrecancelable

  def initialize(plazo_inicial, plazo_real, interes, monto)
    @plazo_inicial = plazo_inicial
    @plazo_real = plazo_real
    @interes= interes
    @monto = monto
  end

  def calcular_ganancia
    monto = ((@plazo_real / 365) * (@interes / 100) * @monto).round(2)
    if @plazo_inicial > @plazo_real
      monto /= 2
    end
    monto
  end

end