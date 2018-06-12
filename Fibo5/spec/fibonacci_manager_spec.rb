require 'rspec'
require_relative '../model/fibonacci_manager'

describe FibonacciManager do

  it 'Deberia invertir la sucesion' do
    manager = FibonacciManager.new([0, 1, 1, 2, 3], {'sentido' => 'inverso'})
    expect(manager.procesar).to eq [3, 2, 1, 1, 0]
  end

end