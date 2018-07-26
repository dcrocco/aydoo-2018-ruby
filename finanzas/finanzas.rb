require_relative 'model/calculador_de_inversiones'

begin
  calculador = CalculadorDeInversiones.new(ARGV)
  valores = calculador.calcular_valores_inversion
  puts 'ganancia: ' + valores[:ganancia].to_s + ' impuesto: ' + valores[:impuesto].to_s
rescue
  puts 'Entrada invalida'
end
