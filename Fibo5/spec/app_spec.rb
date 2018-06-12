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

  it 'deberia devolver el limite de la sucesion 5 y su lista de valores en sentido inverso' do
    get '/fibonacci/5/lista?sentido=inverso'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 5
    expect(respuesta['fibonacci']['lista']).to eq [3, 2, 1, 1, 0]
  end

  it 'deberia devolver el limite de la sucesion 8 y su lista de valores en sentido directo' do
    get '/fibonacci/8/lista?sentido=directo'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 8
    expect(respuesta['fibonacci']['lista']).to eq [0, 1, 1, 2, 3, 5, 8, 13]
  end

  it 'deberia devolver el limite de la sucesion 10 y una lista de valores con solo pares' do
    get '/fibonacci/10/lista?solo=pares'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 10
    expect(respuesta['fibonacci']['lista']).to eq [2, 8, 34]
  end

  it 'deberia devolver el limite de la sucesion 8 y una lista de valores con solo impares' do
    get '/fibonacci/8/lista?solo=impares'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 8
    expect(respuesta['fibonacci']['lista']).to eq [1, 1, 3, 5, 13]
  end

  it 'deberia devolver el limite de la sucesion 8 y una lista de valores con solo impares invertida' do
    get '/fibonacci/8/lista?sentido=inverso&solo=impares'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 8
    expect(respuesta['fibonacci']['lista']).to eq [13, 5, 3, 1, 1]
  end

  it 'deberia devolver el limite de la sucesion 8 y una lista de valores con solo pares invertida' do
    get '/fibonacci/8/lista?sentido=inverso&solo=pares'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 8
    expect(respuesta['fibonacci']['lista']).to eq [8, 2]
  end

  it 'deberia devolver el limite de la sucesion 8 y la suma de valores pares' do
    get '/fibonacci/8/sumatoria?solo=pares'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 8
    expect(respuesta['fibonacci']['sumatoria']).to eq 10
  end

  it 'deberia devolver el limite de la sucesion 8 y la suma de valores impares' do
    get '/fibonacci/8/sumatoria?solo=impares'
    expect(last_response).to be_ok
    respuesta = JSON.parse(last_response.body)
    expect(respuesta['fibonacci']['limite']).to eq 8
    expect(respuesta['fibonacci']['sumatoria']).to eq 23
  end

end