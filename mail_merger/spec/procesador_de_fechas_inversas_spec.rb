require 'rspec'
require_relative '../model/procesador_de_fechas_inversas'

describe ProcesadorDeFechasInversas do

  it 'El procesador recibe un tag de fecha actual inversa y la transforma a AAAA-MM-DD' do
    template_original = 'template con fecha <date:i>'
    template_procesado = ProcesadorDeFechasInversas.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con fecha ' + Date.today.to_s
  end

  it 'El procesador recibe un tag parecido al de fecha y no realiza transformacion' do
    template_original = 'template con fecha <date:o>'
    template_procesado = ProcesadorDeFechasInversas.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con fecha <date:o>'
  end

end
