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

  describe "covertir el json de entrada a un hash" do
    it "debe devolver el json como un hash" do
      json_de_entrada =  '{
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

        hash = JSON.parse(json_de_entrada);
        expect(hash["template"]).to eq "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion"
        expect(hash["contactos"][0]["nombre"]).to eq "juan"
        expect(hash["datos"]["Mail_de_confirmacion"]).to eq "fiesta@untref.com"

    end
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

      hash_entrada = JSON.parse(json);
      creador = Creador.new(hash_entrada);
      puts creador.template;
      #expect(creador.template).to eq "Hola <nombre>, Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>. Sin otro particular.La direccion";

    end
  end

end
