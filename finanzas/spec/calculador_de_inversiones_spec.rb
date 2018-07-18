require 'rspec'
require_relative '../model/calculador_de_inversiones'
require_relative '../model/../model/generador_de_inversiones'


describe 'CalculadorDeInversiones' do

  it 'Inversion de un individuo en dolares de monto 1000 y cotizaciones 20 inicial y 28 final
    deberia tener ganancia 400' do
    inversiones = CalculadorDeInversiones.new(%w(ind dol,1000,20,28))
    valores_inversion = inversiones.calcular_valores_inversion
    expect(valores_inversion[:ganancia]).to eq 400
    expect(valores_inversion[:impuesto]).to eq 0
  end
  #
  # it 'Inversion de un individuo en dolares de monto 1000 y cotizaciones 20 inicial y 28 final
  #   deberia tener ganancia 1400' do
  #   inversiones = CalculadorDeInversiones.new(%w(ind dol,1000))
  #   valores_inversion = inversiones.calcular_valores_inversion
  #   expect(valores_inversion[:ganancia]).to eq 400
  #   expect(valores_inversion[:impuesto]).to eq 0
  # end

  it 'Inversion de una empresa en plazo fijo tradicional de monto 250.000, plazo 90 e interes del 40%
    deberia tener ganancia de 24.658 e impuesto de 1232,90' do
    inversiones = CalculadorDeInversiones.new(%w(emp pft,90,40,250000))
    valores_inversion = inversiones.calcular_valores_inversion
    expect(valores_inversion[:ganancia]).to eq 24657.53
    expect(valores_inversion[:impuesto]).to eq 1232.88
  end

  it 'Inversiones de una empresa en dolares de monto 20.000 con cotizaciones 20 inicial y 29 final y un
    plazo fijo tradicional de monto 250.000, plazo 90 e interes del 40%
    deberia tener ganancia de 32657,5 e impuesto de 1632,90' do
    inversiones = CalculadorDeInversiones.new(%w(emp dol,20000,20,28 pft,90,40,250000))
    valores_inversion = inversiones.calcular_valores_inversion
    expect(valores_inversion[:ganancia]).to eq 32657.53
    expect(valores_inversion[:impuesto]).to eq 1632.88
  end

  it 'Inversiones de un individuo en dolares de monto 100.000 con cotizaciones 18 inicial y 27 final, un
    plazo fijo tradicional de monto 500.000, plazo 365 e interes del 10% y un
    plazo fijo precancelable de monto 100.000, plazo inicial 365, real 300 e interes del 40%
    deberia tener ganancia de 120.000 e impuesto de 9600' do
    inversiones = CalculadorDeInversiones.new(%w(ind pft,365,10,500000 pfp,365,300,40,100000 dol,100000,18,27))
    valores_inversion = inversiones.calcular_valores_inversion
    expect(valores_inversion[:ganancia]).to eq 120000
    expect(valores_inversion[:impuesto]).to eq 9600
  end

  it 'Solo un argumento en el calculador de inversiones deberia devolver una excepcion' do
    expect{CalculadorDeInversiones.new(%w(ind))}.to raise_error ArgumentError, 'No se encontro una inversion para calcular'
  end

  it 'Individuo inexistente deberia devolver una excepcion' do
    expect{CalculadorDeInversiones.new(%w(gob dol))}.to raise_error CalculadorDeInversiones::CalculadorDeImpuestoInvalidoError
  end

  # it 'Valor negativo en la inversion deberia devolver una excepcion' do
  #   expect{CalculadorDeInversiones.new(%w(gob dol,-10,18,27))}.to raise_error CalculadorDeInversiones::CalculadorDeImpuestoInvalidoError
  # end

end
