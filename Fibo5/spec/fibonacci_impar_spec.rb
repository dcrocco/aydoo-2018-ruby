require 'rspec'
require_relative '../model/fibonacci_impar'

describe FibonacciImpar do

  it 'Deberia devolver solo los valores impares' do
    fibo_impar = FibonacciImpar.new
    expect(fibo_impar.procesar([0, 1, 1, 2, 3, 5, 8, 13])).to eq [1, 1, 3, 5, 13]
  end

end