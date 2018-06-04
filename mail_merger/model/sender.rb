require "mail"

class Sender
  def self.enviar(variable)
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end

    Mail.deliver do
      from     'alan_daniel_envio@gmail.com'
      to       'alan_daniel_recibo@gmail.com'
      subject  'Aca esta el mail que mandaste'
      body     variable
    end
  end

end
