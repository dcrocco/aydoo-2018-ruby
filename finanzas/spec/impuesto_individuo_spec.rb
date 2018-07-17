require 'rspec'
require_relative '../model/impuesto_individuo'

describe 'ImpuestoIndividuo' do

  it 'Impuesto para un individuo con ganancia de 400 deberia ser 0' do
    expect(ImpuestoIndividuo.calcular_impuesto(400.0)).to eq 0
  end

end
