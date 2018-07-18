require 'rspec'
require_relative '../model/plazo_fijo_tradicional'

describe 'PlazoFijoTradicional' do

  it 'Inversion en plazo fijo tradicional de monto 250000, plazo 90 e interes del 40%
    deberia tener ganancia de 24658 e impuesto de 1232.90' do
    inversion = PlazoFijoTradicional.new(90.0, 40.0, 250000.0)
    expect(inversion.calcular_ganancia).to eq 24657.53
  end

  it 'Inversion en plazo fijo tradicional con plazo inicial negativo deberia lanzar error' do
    expect{PlazoFijoTradicional.new(365.0, -1.0, 40.00)}.to raise_error PlazoFijoTradicional::PlazoInvalidoError
  end

  it 'Inversion en plazo fijo tradicional con monto negativo deberia lanzar error' do
    expect{PlazoFijoTradicional.new(365.0, 1.0, -40.00)}.to raise_error PlazoFijoTradicional::InteresInvalidoError
  end

end
