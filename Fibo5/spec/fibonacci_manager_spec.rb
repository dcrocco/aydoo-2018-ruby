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

end