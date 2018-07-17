require 'rspec'
require_relative '../model/impuesto_empresa'

describe 'ImpuestoEmpresa' do

  it 'Impuesto para una empresa con ganancia de 32657.53 deberia ser 1632.93' do
    expect(ImpuestoEmpresa.calcular_impuesto(32657.53)).to eq 1632.88
  end

end
