require 'rspec'
require_relative '../model/procesador_de_hora_en_formato_doce'

describe ProcesadorDeHorasEnFormatoDoce do

  it 'El procesador de horas en formato doce recibe un tag time y la transforma a HH:MM en formato 12' do
    template_original = 'template con fecha <time:12>'
    template_procesado = ProcesadorDeHorasEnFormatoDoce.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con fecha ' + Time.now.strftime('%I:%M %p')
  end

  it 'El procesador de horas en formato doce recibe un tag parecido al time y mantiene estructura original' do
    template_original = 'template con fecha <time:11>'
    template_procesado = ProcesadorDeHorasEnFormatoDoce.new.procesar(template_original, {})
    expect(template_procesado).to eq 'template con fecha <time:11>'
  end

end
