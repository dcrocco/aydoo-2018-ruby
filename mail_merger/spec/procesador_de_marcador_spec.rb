require 'rspec'
require_relative '../model/procesador_de_marcador'

describe ProcesadorDeMarcador do

  it 'El procesador recibe un tag con pais sin valor en el template y procesa el valor default' do
    template_original = 'template con pais <empty(pais, argentina)>'
    template_procesado = ProcesadorDeMarcador.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con pais argentina'
  end

  it 'El procesador recibe un tag con pais con valor en el template y procesa el valor del template' do
    template_original = 'template con pais <empty(pais, argentina)>'
    template_procesado = ProcesadorDeMarcador.new.procesar(template_original, {"pais" => "Chile"})
    expect(template_procesado).to eq 'template con pais Chile'
  end

  it 'El procesador recibe un tag con valor aleatorio sin valor en el template y procesa el valor default' do
    template_original = 'template con valor aleatorio <empty(valorAleAtorio, prueba)>'
    template_procesado = ProcesadorDeMarcador.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con valor aleatorio prueba'
  end

  it 'El procesador recibe un tag con valor aleatorio con valor en el template y procesa el valor del template' do
    template_original = 'template con valor aleatorio <empty(valorAleatorio, argentina)>'
    template_procesado = ProcesadorDeMarcador.new.procesar(template_original, {"valorAleatorio" => "Test"})
    expect(template_procesado).to eq 'template con valor aleatorio Test'
  end


end
