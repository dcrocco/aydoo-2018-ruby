require 'rspec'
require_relative '../model/inversion'

describe 'Inversion' do

  it 'Inversion monto negativo deberia devolver una excepcion' do
    expect{Inversion.new(-1000)}.to raise_error Inversion::MontoDeInversionInvalidoError
  end

end
