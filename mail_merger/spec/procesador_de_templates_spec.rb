require 'rspec'
require_relative '../model/procesador_de_templates'

describe ProcesadorDeTemplates do
  subject { ProcesadorDeTemplates.new }

  it 'El template no recibe modificacion' do
    template_original = 'template'
    template_procesado = subject.procesar_template(template_original, {})
    expect(template_original).to eq template_procesado
  end

  it 'El procesador recibe una etiqueta y la reemplaza' do
    template_original = 'template <etiqueta>'
    template_procesado = subject.procesar_template(template_original, {"etiqueta" => "Test"})
    expect(template_procesado).to eq 'template Test'
  end

end