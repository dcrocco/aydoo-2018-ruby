require 'rspec'
require 'rack/test'

describe 'Aplicacion Sinatra' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '1 es 1' do
    it '1 deberia ser igual a 1' do
      expect(1).to eq 1
    end
  end

end
