class CalculadorDeImpuesto

  CALCULO_IMPUESTOS = {
      'ind' => lambda{|valor| calcular_impuesto_individuo(valor)},
      'emp' => lambda{|valor| calcular_impuesto_empresa(valor)}
  }

  def self.calcular_impuesto(persona, valor)
    CALCULO_IMPUESTOS[persona].(valor)
  end

  def self.calcular_impuesto_individuo(valor)
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

  def self.calcular_impuesto_empresa(valor)
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

  private_class_method :calcular_impuesto_empresa, :calcular_impuesto_individuo

end