require "mail"
require_relative "creador"

class Sender
  def enviar(json_de_entrada)

    creador = Creador.new(json_de_entrada);
    creador.crear_archivo();


    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end

    Mail.deliver do
      from     'alan_daniel_envio@gmail.com'
      to       'alan_daniel_recibo@gmail.com'
      subject  'Despues de ricibir el mail, el archivo body.txt deberia borrarse'
      body     File.read('body.txt')
    end

    File.delete("body.txt") if File.exist?("body.txt");

  end


end
