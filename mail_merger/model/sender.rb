require "mail"
require_relative "creador_de_archivo"

class Sender
  def enviar(json_de_entrada)

    creador = CreadorDeArchivo.new(json_de_entrada);
    creador.crear_archivo();


    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end

    Mail.deliver do
      from     'alan_daniel_envio@gmail.com'
      to       'alan12394@hotmail.com'
      subject  'Despues de ricibir el mail, el archivo body.txt deberia borrarse'
      body     File.read('body.txt')
    end

    File.delete("body.txt") if File.exist?("body.txt");

  end


end
