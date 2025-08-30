defmodule Calculo_salario do

  @moduledoc """
    Módulo para calcular el salario total de un empleado
    incluyendo horas extra.
  """

  @doc """
    Calcula y muestra el salario total de un empleado a partir de un
    salario base y horas extra.
  """
  def calcular_salario do
    nombre = Util.input("Ingrese el nombre del empleado: ", :String)
    salario = Util.input("Ingrese el salario base: ", :float)
    horas_extra = Util.input("Ingrese las horas extra trabajadas: ", :integer)
    valor_hora = salario / 160
    salario_total = salario + horas_extra * (valor_hora * 1.5)

    Util.show_message("El salario total de #{nombre} es de #{Util.format_price(salario_total)}")
  end

end

Calculo_salario.calcular_salario()
