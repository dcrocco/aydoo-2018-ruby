class InversionDolares

  def initialize(monto, cotizacion_inicial, cotizacion_final)
    @monto = monto
    @cotizacion_inicial = cotizacion_inicial
    @cotizacion_final = cotizacion_final
  end

  def calcular_ganancia
    (@monto * (@cotizacion_final / @cotizacion_inicial  - 1)).round(2)
   end

end