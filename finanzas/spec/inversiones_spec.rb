require 'rspec'
require_relative '../model/inversiones'

describe 'Inversiones' do

  it 'Inversion de un individuo en dolares de monto 1000 y cotizaciones 20 inicial y 28 final
    deberia tener ganancia 400 y no deberia tener impuesto' do
    inversiones = Inversiones.obtener_inversiones(['ind dol,100,20,28'])
    expect(inversiones[0].obtener_ganancia).to eq 400
    expect(inversiones[0].obtener_impuesto).to eq 0
  end

end
