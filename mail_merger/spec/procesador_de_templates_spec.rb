require 'rspec'
require_relative '../model/procesador_de_templates'

describe ProcesadorDeTemplates do

  it 'El template no recibe modificacion y se espera que este igual' do
    template_original = 'template'
    template_procesado = ProcesadorDeTemplates.new.procesar_template(template_original, {})
    expect(template_original).to eq template_procesado
  end

  it 'El procesador recibe un tag con multiples etiquetas especiales y tags adicionales y procesa todos los tags' do
    template_original = 'suma <sum(3, 2)>, pais <empty(pais, argentina)>, <etiqueta>, fecha <date:i>'
    template_procesado = ProcesadorDeTemplates.new.procesar_template(template_original, {"pais" => "Uruguay", "etiqueta" => "Test"})
    expect(template_procesado).to eq 'suma 5, pais Uruguay, Test, fecha ' + Date.today.to_s
  end

  it "El procsador recibe un template con nombre_evento y lugar_del_evento y lo reemplaza" do
    template_original = "Hola <nombre>, por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>."
    template_procesado = ProcesadorDeTemplates.new.procesar_template(template_original, {"nombre_evento"=>"Casorio untref", "lugar_del_evento"=>"SEDE1", "nombre"=>"Juan"})
    expect(template_procesado).to eq "Hola Juan, por medio del presente mail te estamos invitando a Casorio untref, que se desarrollará en SEDE1."
  end

end
