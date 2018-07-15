require 'rack/test'
require_relative "../app.rb"
require_relative "../model/enviador_de_mails.rb"
require "sinatra"
require "mail"

describe 'Mail Merger' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '/' do
    it 'Archivo valido deberia devolver ok' do
      path = File.join(File.dirname(__FILE__), 'data1.json')
      Enviador.any_instance.stub(:enviar)
      post '/', File.read(path)
      expect(last_response).to be_ok
    end
  end

  describe '/' do
    it 'Archivo invalido deberia devolver error' do
      path = File.join(File.dirname(__FILE__), 'data2_esquema_incorrecto.json')
      Enviador.any_instance.stub(:enviar).and_raise(StandardError.new("Error"))
      expect{post '/', File.read(path)}.to raise_error(StandardError)
    end
  end

  describe '/' do
    it 'Mandar un mail, si el servidor está caído, levanta y atrapa la excepción' do
      path = File.join(File.dirname(__FILE__), 'data1.json')
      Mail.stub(:deliver)
      post '/', File.read(path)
      expect(last_response.body).to eq '{"resultado":"ok"}'
    end
  end

end
