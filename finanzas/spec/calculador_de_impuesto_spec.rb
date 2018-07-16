require 'rspec'
require_relative '../model/calculador_de_impuesto'

describe 'CalculadorDeImpuesto' do

  it 'Impuesto para un individuo con ganancia de 400 deberia ser 0' do
    expect(CalculadorDeImpuesto.calcular_impuesto('ind', 400.0)).to eq 0
  end

  it 'Impuesto para una empresa con ganancia de 32657.53 deberia ser 1632.93' do
    expect(CalculadorDeImpuesto.calcular_impuesto('emp', 32657.53)).to eq 1632.88
  end

end
