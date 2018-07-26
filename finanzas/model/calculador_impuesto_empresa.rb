require_relative 'calculador_impuesto'

class CalculadorImpuestoEmpresa < CalculadorImpuesto

  def self.calcular_impuesto(valor)
    super(valor)
    impuesto = 0
    if valor.between?(20000, 50000)
      impuesto = valor * 0.05
    elsif valor.between?(50000, 100000)
      impuesto = valor * 0.1
    elsif valor.between?(100000, 500000)
      impuesto = valor * 0.15
    elsif valor >= 500000
      impuesto = valor * 0.2
    end
    impuesto.round(2)
  end

end