require 'rspec'
require_relative '../model/procesador_de_fechas'

describe ProcesadorDeFechas do

  it 'El procesador recibe un tag de fecha actual y la transforma a DD-MM-AA' do
    template_original = 'template con fecha <date:d>'
    template_procesado = ProcesadorDeFechas.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con fecha ' + Date.today.strftime('%d-%m-%Y')
  end

end
