require 'rspec'
require_relative '../model/enviador_de_mails'

describe Enviador do

  it 'Se intenta en viar un mail con un hash valido y no deberia devolver excepciones' do
    hash_valido = {
      "template" => "Template Test",
      "datos" => {
        "remitente" => "test@remitente.com",
        "asunto" => "Asunto del mail"
      },
      "contactos" => [{"mail" => "contacto@mail.com"}]
    }
    sender = Enviador.new
    sender.stub(:enviar_mail){true}
    sender.enviar(hash_valido)
  end

  it 'Se intenta enviar un mail con un hash sin contactos y se espera una excepcion de JSON incompleto' do
    hash_no_valido = {
      "template" => "Template Test",
      "datos" => {
        "remitente" => "test@remitente.com",
        "asunto" => "Asunto del mail"
      }
    }
    sender = Enviador.new
    expect {sender.enviar(hash_no_valido)}.to raise_error(ExcepcionJSONIncompleto)
  end

  it 'Se intenta enviar un mail con un hash sin asunto y se espera una excepcion de JSON incompleto' do
    hash_no_valido = {
      "template" => "Template Test",
      "datos" => {
        "remitente" => "test@remitente.com",
      },
      "contactos" => [{"mail" => "contacto@mail.com"}]
    }
    sender = Enviador.new
    expect {sender.enviar(hash_no_valido)}.to raise_error(ExcepcionJSONIncompleto)
  end

end
