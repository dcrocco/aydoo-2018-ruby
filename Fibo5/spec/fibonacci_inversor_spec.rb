require 'rspec'
require_relative '../model/fibonacci_inversor'

describe FibonacciInversor do

  it 'Deberia invertir la sucesion' do
    lista_sucesion = [0, 1, 1, 2, 3]
    inversor = FibonacciInversor.new
    expect(inversor.procesar(lista_sucesion)).to eq [3, 2, 1, 1, 0]
  end

end