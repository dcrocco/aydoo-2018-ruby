require 'rspec'
require_relative '../model/procesador_de_sum'

describe ProcesadorDeSum do

  it 'El procesador recibe un tag con una suma de montos y procesa la suma de los mismos' do
    template_original = 'template con suma de montos <sum(5, 20)>'
    template_procesado = ProcesadorDeSum.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con suma de montos 25'
  end

  it 'El procesador recibe un tag con una suma de montos con decimales y no lo procesa' do
    template_original = 'template con suma de montos <sum(5.1, 20.2)>'
    template_procesado = ProcesadorDeSum.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con suma de montos <sum(5.1, 20.2)>'
  end

  it 'El procesador recibe un tag con sum y palabras dentro y no lo procesa' do
    template_original = 'template con suma de montos <sum(a, 20)>'
    template_procesado = ProcesadorDeSum.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con suma de montos <sum(a, 20)>'
  end

end
