require 'rspec'
require 'rack/test'
require_relative '../app'

describe 'Fibo5' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'deberia devolver sucesion de fibo5' do
    get '/fibonacci/5'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 5
  end

end