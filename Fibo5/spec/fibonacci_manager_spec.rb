require 'rspec'
require_relative '../model/fibonacci_manager'

describe FibonacciManager do

  it 'Deberia invertir la sucesion' do
    manager = FibonacciManager.new([0, 1, 1, 2, 3], {'sentido' => 'inverso'})
    expect(manager.procesar).to eq [3, 2, 1, 1, 0]
  end

  it 'Deberia obtener valores pares solamente' do
    manager = FibonacciManager.new([0, 1, 1, 2, 3, 5, 8], {'solo' => 'pares'})
    expect(manager.procesar).to eq [2, 8]
  end

  it 'Deberia obtener valores impares solamente' do
    manager = FibonacciManager.new([0, 1, 1, 2, 3, 5, 8, 13], {'solo' => 'impares'})
    expect(manager.procesar).to eq [1, 1, 3, 5, 13]
  end

  it 'Lista de valores con solo impares invertida' do
    manager = FibonacciManager.new([0, 1, 1, 2, 3, 5, 8, 13], {'solo' => 'impares', 'sentido' => 'inverso'})
    expect(manager.procesar).to eq [13, 5, 3, 1, 1]
  end

  it 'deberia devolver el limite de la sucesion 8 y una lista de valores con solo pares invertida' do
    manager = FibonacciManager.new([0, 1, 1, 2, 3, 5, 8, 13], {'solo' => 'pares', 'sentido' => 'inverso'})
    expect(manager.procesar).to eq [8, 2]
  end

end