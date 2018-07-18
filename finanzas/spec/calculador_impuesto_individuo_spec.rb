require 'rspec'
require_relative '../model/calculador_impuesto_individuo'

describe 'CalculadorImpuestoIndividuo' do

  it 'Impuesto para un individuo con ganancia de 400 deberia ser 0' do
    expect(CalculadorImpuestoIndividuo.calcular_impuesto(400.0)).to eq 0
  end

end
