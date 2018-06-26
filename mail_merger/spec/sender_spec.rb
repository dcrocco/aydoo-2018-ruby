require 'rspec'
require_relative '../model/sender'

describe Sender do

  it 'Se intenta en viar un mail con un hash valido' do
    hash_valido = {
      "template" => "Template Test",
      "datos" => {
        "remitente" => "test@remitente.com",
        "asunto" => "Asunto del mail"
      },
      "contactos" => [{"mail" => "contacto@mail.com"}]
    }
    sender = Sender.new
    sender.stub(:enviar_mail){true}
    sender.enviar(hash_valido)
  end

  it 'Se intenta enviar un mail con un hash sin contactos' do
    hash_no_valido = {
      "template" => "Template Test",
      "datos" => {
        "remitente" => "test@remitente.com",
        "asunto" => "Asunto del mail"
      }
    }
    sender = Sender.new
    expect {sender.enviar(hash_no_valido)}.to raise_error(ArgumentError)
  end

  it 'Se intenta enviar un mail con un hash sin asunto' do
    hash_no_valido = {
      "template" => "Template Test",
      "datos" => {
        "remitente" => "test@remitente.com",
      },
      "contactos" => [{"mail" => "contacto@mail.com"}]
    }
    sender = Sender.new
    expect {sender.enviar(hash_no_valido)}.to raise_error(ArgumentError)
  end

end
