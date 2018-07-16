require 'rspec'
require_relative '../model/inversion_plazo_fijo_tradicional'

describe 'InversionPlazoFijoTradicional' do

  it 'Inversion en plazo fijo tradicional de monto 250000, plazo 90 e interes del 40%
    deberia tener ganancia de 24658 e impuesto de 1232.90' do
    inversion = InversionPlazoFijoTradicional.new(90.0, 40.0, 250000.0)
    expect(inversion.calcular_ganancia).to eq 24657.53
  end

end
