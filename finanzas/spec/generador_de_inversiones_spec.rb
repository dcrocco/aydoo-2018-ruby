require 'rspec'
require_relative '../model/generador_de_inversiones'

describe 'GeneradorDeInversiones' do

  it 'Intentar generar una inversion inexistente deberia lanzar excepcion' do
    expect{GeneradorDeInversiones.obtener_inversiones(%w(nodol,1,2,3))}.to raise_error GeneradorDeInversiones::InversionInexistenteError
  end

  it 'Intentar generar una inversion con invalida menos argumentos deberia lanzar excepcion' do
    expect{GeneradorDeInversiones.obtener_inversiones(%w(dol,1,2))}.to raise_error ArgumentError
  end

  it 'Intentar generar una inversion con invalida mas argumentos deberia lanzar excepcion' do
    expect{GeneradorDeInversiones.obtener_inversiones(%w(dol,1,2,3,4))}.to raise_error ArgumentError
  end

  it 'Intentar generar una inversion con un argumento no numerico deberia lanzar excepcion' do
    expect{GeneradorDeInversiones.obtener_inversiones(%w(dol,1,2,3,t))}.to raise_error ArgumentError
  end

end
