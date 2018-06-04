require 'rspec'
require 'rack/test'
require 'byebug'
require_relative "../model/creador"
require "json"

describe 'toma_de_datos' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  

end
