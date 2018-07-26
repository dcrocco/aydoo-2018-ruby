require 'rspec'
require_relative '../model/calculador_impuesto_empresa'

describe 'CalculadorImpuestoEmpresa' do

  it 'Impuesto para una empresa con ganancia de 32657.53 deberia ser 1632.93' do
    expect(CalculadorImpuestoEmpresa.calcular_impuesto(32657.53)).to eq 1632.88
  end

end
