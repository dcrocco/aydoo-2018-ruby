require 'rspec'
require_relative '../model/fibonacci_par'

describe FibonacciPar do

  it 'Deberia devolver solo los valores pares' do
    fibo_par = FibonacciPar.new([0, 1, 1, 2, 3, 5, 8])
    expect(fibo_par.procesar).to eq [2, 8]
  end

end