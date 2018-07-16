require_relative 'impuesto_empresa'
require_relative 'impuesto_individuo'


class CalculadorDeImpuesto

  CALCULO_IMPUESTOS = {
      'ind' => lambda{|valor| ImpuestoIndividuo.calcular_impuesto(valor)},
      'emp' => lambda{|valor| ImpuestoEmpresa.calcular_impuesto(valor)}
  }

  def self.calcular_impuesto(persona, valor)
    CALCULO_IMPUESTOS[persona].(valor)
  end

end