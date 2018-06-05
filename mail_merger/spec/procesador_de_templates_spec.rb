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

  it 'El procesador recibe etiqueta sin contenido y no la procesa' do
    template_original = 'template <>, probando <otra etiqueta>'
    etiquetas = {"otra etiqueta" => "Valor otra etiqueta"}
    template_procesado = subject.procesar_template(template_original, etiquetas)
    expect(template_procesado).to eq 'template <>, probando Valor otra etiqueta'
  end

  it 'El procesador recibe un tag de fecha actual inversa y la transforma a AAAA-MM-DD' do
    template_original = 'template con fecha <date:i>'
    template_procesado = subject.procesar_template(template_original, {})
    expect(template_procesado).to eq 'template con fecha ' + Date.today.to_s
  end

  it 'El procesador recibe un tag de fecha actual y la transforma a DD-MM-AA' do
    template_original = 'template con fecha <date:d>'
    template_procesado = subject.procesar_template(template_original, {})
    expect(template_procesado).to eq 'template con fecha ' + Date.today.strftime('%d-%m-%Y')
  end

  it 'El procesador recibe un tag con pais sin valor en el template' do
    template_original = 'template con pais <empty(pais, argentina)>'
    template_procesado = subject.procesar_template(template_original, {})
    expect(template_procesado).to eq 'template con pais argentina'
  end

  it 'El procesador recibe un tag con pais con valor en el template' do
    template_original = 'template con pais <empty(pais, argentina)>'
    template_procesado = subject.procesar_template(template_original, {"pais" => "Chile"})
    expect(template_procesado).to eq 'template con pais Chile'
  end

  it 'El procesador recibe un tag con una suma de montos' do
    template_original = 'template con suma de montos <sum(5, 20)>'
    template_procesado = subject.procesar_template(template_original, {})
    expect(template_procesado).to eq 'template con suma de montos 25'
  end

  it 'El procesador recibe un tag con multiples etiquetas especiales y tags adicionales' do
    template_original = 'suma <sum(3, 2)>, pais <empty(pais, argentina)>, <etiqueta>, fecha <date:i>'
    template_procesado = subject.procesar_template(template_original, {"pais" => "Uruguay", "etiqueta" => "Test"})
    expect(template_procesado).to eq 'suma 5, pais Uruguay, Test, fecha ' + Date.today.to_s
  end

  it "El procsador recibe un template con nombre_evento y lugar_del_evento y lo reemplaza" do
    template_original = "Hola <nombre>, por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>."
    template_procesado = subject.procesar_template(template_original, {"nombre_evento"=>"Casorio untref", "lugar_del_evento"=>"SEDE1", "nombre"=>"Juan"});
    expect(template_procesado).to eq "Hola Juan, por medio del presente mail te estamos invitando a Casorio untref, que se desarrollará en SEDE1."
  end

end
