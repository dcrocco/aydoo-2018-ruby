require_relative "procesador_de_templates"

class Sender

  def initialize
    @procesador_de_templates = ProcesadorDeTemplates.new
  end

  def enviar(hash_entrada)
    procesador_de_json = ProcesadorDeJson.new(hash_entrada)

    (0...hash_entrada["contactos"].length).each {|indice|

      procesador_de_json.procesar(indice)

      Mail.defaults do
        delivery_method :smtp, address: "localhost", port: 1025
      end

      Mail.deliver do
        from hash_entrada["datos"]["remitente"]
        to hash_entrada["contactos"][i]["mail"]
        subject hash_entrada["datos"]["asunto"]
        body hash_entrada.procesar(indice)
      end
    }
  end
end
