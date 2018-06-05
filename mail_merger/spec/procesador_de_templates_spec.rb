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

  it 'El procesador recibe multiples etiquetas y las reemplaza' do
    template_original = 'template <etiqueta>, probando <otra etiqueta>'
    etiquetas = {"etiqueta" => "Valor etiqueta", "otra etiqueta" => "Valor otra etiqueta"}
    template_procesado = subject.procesar_template(template_original, etiquetas)
    expect(template_procesado).to eq 'template Valor etiqueta, probando Valor otra etiqueta'
  end

  it 'El procesador recibe etiqueta invalida y no la procesa' do
    template_original = 'template <etiquetaInvalida>, probando <otra etiqueta>'
    etiquetas = {"otra etiqueta" => "Valor otra etiqueta"}
    template_procesado = subject.procesar_template(template_original, etiquetas)
    expect(template_procesado).to eq 'template <etiquetaInvalida>, probando Valor otra etiqueta'
  end

end