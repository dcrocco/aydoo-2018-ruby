require 'rspec'
require 'rack/test'
require_relative '../app'

describe 'Fibo5' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'deberia devolver el limite de la sucesion 5' do
    get '/fibonacci/5'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 5
  end

  it 'deberia devolver el limite de la sucesion 5 y una lista con cada valor' do
    get '/fibonacci/5/lista'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 5
    expect(respuesta['fibonacci']['lista']).to eq [0, 1, 1, 2, 3]
  end

  it 'deberia devolver el limite de la sucesion 5 y la sumatoria de sus valores (7)' do
    get '/fibonacci/5/sumatoria'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 5
    expect(respuesta['fibonacci']['sumatoria']).to eq 7
  end

end