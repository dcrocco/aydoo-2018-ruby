require 'rspec'
require_relative '../model/calculador_impuesto'

describe 'CalculadorImpuesto' do

  it 'Ganancia negativo debria devolver 0 en el calculo' do
    expect(CalculadorImpuesto.calcular_impuesto(-32657.53)).to eq 0
  end

end
