require_relative 'calculador_impuesto'

class CalculadorImpuestoIndividuo < CalculadorImpuesto

  def self.calcular_impuesto(valor)
    super(valor)
    impuesto = 0
    if valor.between?(50000, 100000)
      impuesto = valor * 0.05
    elsif valor.between?(100000, 500009)
      impuesto = valor * 0.08
    elsif valor >= 500000
      impuesto = valor * 0.1
    end
    impuesto.round(2)
  end

end