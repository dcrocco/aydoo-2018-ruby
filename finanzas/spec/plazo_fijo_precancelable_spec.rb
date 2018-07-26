require 'rspec'
require_relative '../model/plazo_fijo_tradicional'

describe 'PlazoFijoPrecancelable' do

  it 'Inversion en plazo fijo precancelable de monto 100.000, plazo inicial 365, real 300 e interes del 40%
    deberia tener ganancia de 20.000' do
    inversion = PlazoFijoPrecancelable.new(365.0, 300.0, 40.0, 100000.0)
    expect(inversion.calcular_ganancia).to eq 20000.0
  end

  it 'Inversion en plazo fijo precancelable con plazo real mayor al inicial deberia lanzar error' do
    expect{PlazoFijoPrecancelable.new(365.0, 400.0, 40.0, 100000.0)}.to raise_error PlazoFijoPrecancelable::PlazoInvalidoError
  end

end
