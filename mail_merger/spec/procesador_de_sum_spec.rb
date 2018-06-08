require 'rspec'
require_relative '../model/procesador_de_sum'

describe ProcesadorDeSum do

  it 'El procesador recibe un tag con una suma de montos' do
    template_original = 'template con suma de montos <sum(5, 20)>'
    template_procesado = ProcesadorDeSum.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con suma de montos 25'
  end

end
