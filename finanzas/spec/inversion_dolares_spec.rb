require 'rspec'
require_relative '../model/inversion_dolares'

describe 'InversionDolares' do

  it 'Inversion en dolares de monto 1000 y cotizaciones 20 inicial y 28 final
    deberia tener ganancia 400 y no deberia tener impuesto' do
    inversion = InversionDolares.new(1000.0, 20.0, 28.0)
    expect(inversion.calcular_ganancia).to eq 400.0
  end

  it 'Inversion dolares de monto 20000 con cotizaciones 20 inicial y 28 final y un
    deberia tener ganancia de 32657.5 e impuesto de 1632.90' do
    inversion = InversionDolares.new(20000.0, 20.0, 28.0)
    expect(inversion.calcular_ganancia).to eq 8000.0
  end

  it 'Inversion dolares con cotizacion incial negativa deberia devolver excepcion' do
    expect{InversionDolares.new(20000.0, -20.0, 28.0)}.to raise_error InversionDolares::CotizacionesInvalidasError
  end

  it 'Inversion dolares con cotizacion final negativa deberia devolver excepcion' do
    expect{InversionDolares.new(20000.0, 20.0, -28.0)}.to raise_error InversionDolares::CotizacionesInvalidasError
  end

  it 'Inversion dolares con cotizacion inicial nula deberia devolver excepcion' do
    expect{InversionDolares.new(20000.0, 0.0, -28.0)}.to raise_error InversionDolares::CotizacionesInvalidasError
  end

end
