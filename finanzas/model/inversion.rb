class Inversion

  class MontoDeInversionInvalidoError < StandardError
  end

  def initialize(monto)
    if monto < 0
      raise MontoDeInversionInvalidoError
    end
    @monto = monto
  end

end