require 'rspec'
require_relative '../model/fibonacci'
require_relative '../model/errors'

describe Fibonacci do
  subject {Fibonacci.new}

  it 'Deberia devolver el limite de la sucesion 5 y una lista con cada valor' do
    expect(subject.obtener_valores(5)).to eq [0, 1, 1, 2, 3]
  end

  it 'Deberia devolver error por ser un numero negativo' do
    expect{subject.obtener_valores(-5)}.to raise_error(FibonacciNumberError)
  end

end