require 'rspec'

describe Fibonacci do
  subject {Fibonacci.new}

  it 'Deberia devolver el limite de la sucesion 5 y una lista con cada valor' do
    expect(subject.obtener_valores(5)).to eq [0, 1, 1, 2, 3]
  end

end