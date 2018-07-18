class CalculadorImpuesto

  class ValorImpuestoError < StandardError
  end

  def self.calcular_impuesto(valor)
    if valor < 0
      raise ValorImpuestoError
    end
  end

end