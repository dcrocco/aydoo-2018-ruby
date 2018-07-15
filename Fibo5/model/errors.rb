class ArgumentSentidoError < ArgumentError

  def initialize(msg="Argumento 'sentido' inválido")
    super
  end

end

class ArgumentSoloError < ArgumentError

  def initialize(msg="Argumento 'solo' inválido")
    super
  end

end

class FibonacciNumberError < ArgumentError

  def initialize(msg="Numero inválido para serie de fibonacci")
    super
  end

end