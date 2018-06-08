require 'rspec'
require_relative '../model/procesador_de_paises'

describe ProcesadorDePaises do

  it 'El procesador recibe un tag con pais sin valor en el template' do
    template_original = 'template con pais <empty(pais, argentina)>'
    template_procesado = ProcesadorDePaises.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con pais argentina'
  end

  it 'El procesador recibe un tag con pais con valor en el template' do
    template_original = 'template con pais <empty(pais, argentina)>'
    template_procesado = ProcesadorDePaises.new.procesar(template_original, {"pais" => "Chile"})
    expect(template_procesado).to eq 'template con pais Chile'
  end

end
