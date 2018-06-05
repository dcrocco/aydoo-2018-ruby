
class Datos

  attr_accessor :asunto, :nombre_evento, :lugar_evento, :fecha_del_evento, :mail_de_confirmacion;

  def initialize(remitente, asunto, nombre_evento, lugar_evento, fecha_del_evento, mail_de_confirmacion)
    @remitente = remitente
    @asunto = asunto;
    @nombre_evento = nombre_evento;
    @lugar_evento = lugar_evento;
    @fecha_del_evento = fecha_del_evento;
    @mail_de_confirmacion = mail_de_confirmacion;
  end

end
