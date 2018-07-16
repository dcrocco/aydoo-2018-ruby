require 'rspec'
require_relative '../model/inversiones'

describe 'Inversiones' do

  it 'Inversion de un individuo en dolares de monto 1000 y cotizaciones 20 inicial y 28 final
    deberia tener ganancia 400' do
    inversiones = Inversiones.new(['ind dol,1000,20,28'])
    expect(inversiones.calcular_ganancia).to eq 400
    expect(inversiones.calcular_impuesto).to eq 0
  end

  it 'Inversion de una empresa en plazo fijo tradicional de monto 250000, plazo 90 e interes del 40%
    deberia tener ganancia de 24658 e impuesto de 1232.90' do
    inversiones = Inversiones.new(['emp pft,90,40,250000'])
    expect(inversiones.calcular_ganancia).to eq 24657.53
    expect(inversiones.calcular_impuesto).to eq 1232.88
  end

  it 'Inversiones de una empresa en dolares de monto 20000 con cotizaciones 20 inicial y 29 final y un
    plazo fijo tradicional de monto 250000, plazo 90 e interes del 40%
    deberia tener ganancia de 32657.5 e impuesto de 1632.90' do
    inversiones = Inversiones.new(['emp dol,20000,20,28 pft,90,40,250000'])
    expect(inversiones.calcular_ganancia).to eq 32657.53
    expect(inversiones.calcular_impuesto).to eq 1632.88
  end

end
