require "mail"
require_relative "creador_de_archivo"

class Sender
  def enviar(hash_entrada)
    cantidad_de_contactos_a_enviar_mails = hash_entrada["contactos"].length;

    for i in(0...cantidad_de_contactos_a_enviar_mails)
      creador = CreadorDeArchivo.new(hash_entrada);
      creador.crear_archivo(i);

      Mail.defaults do
        delivery_method :smtp, address: "localhost", port: 1025
      end

      Mail.deliver do
        from     hash_entrada["datos"]["remitente"]
        to       hash_entrada["contactos"][i]["mail"]
        subject  hash_entrada["datos"]["asunto"]
        body     File.read('body.txt')
      end

      File.delete("body.txt") if File.exist?("body.txt");
    end
  end
end
