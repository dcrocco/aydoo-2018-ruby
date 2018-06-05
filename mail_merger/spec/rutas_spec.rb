require 'rspec'
require 'rack/test'
require 'byebug'

require "json"

describe 'rutas_spec' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end



end
