require 'rspec'
require 'rack/test'
require 'byebug'
require_relative "../model/creador"

describe 'toma_de_datos' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "tomar json" do
    it 'dar un archivo json y verificar la entrada' do
      json =  '{
                  "template":"Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion",
                  "contactos":[
                     {
                        "nombre":"juan",
                        "apellido":"perez",
                        "mail":"juanperez@test.com"
                     },
                     {
                        "nombre":"maria",
                        "apellido":"gonzalez",
                        "mail":"mariagonzalez@test.com"
                     }
                  ],
                  "datos":{
                    "remitente":"universidad@untref.com",
                     "asunto":"Invitación a fiesta de fin de año",
                     "nombre_evento":"la cena de fin de año de la UNTREF",
                     "lugar_evento":"el Centro de estudios (avenida Directorio 887, Caseros)",
                     "fecha_del_evento":"5 de diciembre",
                     "Mail_de_confirmacion":"fiesta@untref.com"
                  }
                }'
      creador = Creador.new(json);
    end
  end

end
