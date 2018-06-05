require 'rspec'
require_relative '../model/procesador_de_templates'

describe ProcesadorDeTemplates do
  subject { ProcesadorDeTemplates.new }

  it 'El template no recibe modificacion' do
    subject.procesar_template('template')
  end
  
end