require 'rspec'
require 'rack/test'
require 'byebug'
require_relative "../model/procesador_de_json"
require "json"

describe ProcesadorDeJson do
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

        hash = JSON.parse(json_de_entrada)
        expect(hash["template"]).to eq "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion"
        expect(hash["contactos"][0]["nombre"]).to eq "juan"
        expect(hash["datos"]["Mail_de_confirmacion"]).to eq "fiesta@untref.com"

    end
  end

  describe "tomar json, parsearlo a hash y chequear claves" do
    it 'dar un archivo json y verificar la conversion' do
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

      hash_entrada = JSON.parse(json)
      p hash_entrada
      procesador = ProcesadorDeJson.new(hash_entrada)
      expect(procesador.datos["remitente"]).to eq "universidad@untref.com"
      expect(procesador.datos["lugar_evento"]).to eq "el Centro de estudios (avenida Directorio 887, Caseros)"
      expect(procesador.contactos[0]["apellido"]).to eq "perez"

    end
  end

  describe "Parsear el JSON de entrada y que cuente la cantidad de contactos que tiene" do
    it "El length del Hash del JSON parseado debería devolver 2 por que tiene 2 contactos nada más" do
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
      hash_entrada = JSON.parse(json)
      expect(hash_entrada["contactos"].length).to eq 2
      expect(hash_entrada["contactos"][0]["nombre"]).to eq "juan"
    end
  end

  describe "Json sin contactos" do
    it "deberia tirar error" do
      json = '{
          "template":"Template test",
          "datos": {"remitente": "universidad@untref.com"}
      }'
      expect {ProcesadorDeJson.new(JSON.parse(json))}.to raise_error(ArgumentError)
    end
  end

end
