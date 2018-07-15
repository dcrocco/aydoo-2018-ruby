require 'rspec'
require_relative '../model/fibonacci_par'

describe FibonacciPar do

  it 'Deberia devolver solo los valores pares' do
    fibo_par = FibonacciPar.new()
    expect(fibo_par.procesar([0, 1, 1, 2, 3, 5, 8])).to eq [2, 8]
  end

end