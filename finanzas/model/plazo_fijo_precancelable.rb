class PlazoFijoPrecancelable < Inversion

  def initialize(plazo_inicial, plazo_real, interes, monto)
    super(monto)
    @plazo_inicial = plazo_inicial
    @plazo_real = plazo_real
    @interes= interes
  end

  def calcular_ganancia
    monto = ((@plazo_inicial / 365) * (@interes / 100) * @monto).round(2)
    if @plazo_inicial > @plazo_real
      monto /= 2
    end
    monto
  end

end