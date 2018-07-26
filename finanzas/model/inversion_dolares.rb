require_relative 'inversion'

class InversionDolares < Inversion

  class CotizacionesInvalidasError < StandardError
  end

  def initialize(monto, cotizacion_inicial, cotizacion_final)
    super(monto)
    if cotizacion_inicial <= 0 or cotizacion_final <= 0
      raise CotizacionesInvalidasError
    end
    @cotizacion_inicial = cotizacion_inicial
    @cotizacion_final = cotizacion_final
  end

  def calcular_ganancia
    (@monto * (@cotizacion_final / @cotizacion_inicial - 1)).round(2)
   end

end