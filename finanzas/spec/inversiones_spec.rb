require 'rspec'
require_relative '../model/inversiones'

describe 'Inversiones' do

  it 'Inversion de un individuo en dolares de monto 1000 y cotizaciones 20 inicial y 28 final
    deberia tener ganancia 400 y no deberia tener impuesto' do
    inversiones = Inversiones.new(['ind dol,100,20,28'])
    expect(inversiones.calcular_ganancia).to eq 400
    expect(inversiones.calcular_impuesto).to eq 0
  end

  it 'Inversion de una empresa en plazo fijo tradicional de monto 250000, plazo 90 e interes del 40%
    deberia tener ganancia de 24658 e impuesto de 1232.90' do
    inversiones = Inversiones.new(['emp pft,90,40,25000'])
    expect(inversiones.calcular_ganancia).to eq 24658
    expect(inversiones.calcular_impuesto).to eq 1232.90
  end

end
