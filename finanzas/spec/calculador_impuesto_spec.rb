require 'rspec'
require_relative '../model/calculador_impuesto'

describe 'CalculadorImpuesto' do

  it 'Impuesto negativo debria lanzar una excepcion' do
    expect{CalculadorImpuesto.calcular_impuesto(-32657.53)}.to raise_error CalculadorImpuesto::ValorImpuestoError
  end

end
