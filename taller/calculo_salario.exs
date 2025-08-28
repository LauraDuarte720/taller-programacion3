defmodule Calculo_salario do
  def calcular_salario do
    nombre = Util.input("Ingrese el nombre del empleado: ", :String)
    salario = Util.input("Ingrese el salario base: ", :float)
    horas_extra = Util.input("Ingrese las horas extra trabajadas: ", :integer)
    valor_hora = salario / 160
    salario_total = salario + horas_extra * (valor_hora * 1.5)

    Util.show_message("El salario total de #{nombre} es de #{salario_total}")
  end

  Calculo_salario.calcular_salario()
end
