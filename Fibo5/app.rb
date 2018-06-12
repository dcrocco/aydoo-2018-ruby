require "sinatra"
require "json"
require_relative "model/fibonacci"

configure do
  set :bind, '0.0.0.0'
end

get '/fibonacci/:limite' do
  begin
    sucesion = params['limite']
    {"fibonacci": { "limite": sucesion.to_i }}.to_json
  end

end