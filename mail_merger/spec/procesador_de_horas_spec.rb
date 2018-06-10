require 'rspec'
require_relative '../model/procesador_de_hora'

describe ProcesadorDeHoras do

  it 'El procesador recibe un tag time y la transforma a HH:MM en formato 24' do
    template_original = 'template con fecha <time>'
    template_procesado = ProcesadorDeHoras.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con fecha ' + Time.now.strftime('%H:%M')
  end

end
