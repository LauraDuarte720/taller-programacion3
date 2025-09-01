defmodule Vehiculo_peaje do

  @moduledoc """
    Módulo para registrar vehículos en un peaje y calcular el valor a pagar
    según su tipo y peso.
  """

  @doc """
    Solicita al usuario la placa, tipo y peso del vehículo.
    Calcula la tarifa correspondiente y muestra el valor a pagar.
  """

  def registrar_vehiculo() do
    placa =
      Util.input("Ingrese la placa del vehiculo: ", :string)
      |> String.upcase()
    vehiculo = Util.pedir_tipo(["Carro", "Moto", "Camion"], "Ingrese el tipo de vehículo(Carro, Moto, Camioni): ", "El tipo de vehículo no existe, reintente de nuevo")
    tonelada = Util.input("Ingrese el peso del vehículo (toneladas): ", :float)

    tarifa =
      cond do
        vehiculo == "Carro" -> 10000
        vehiculo == "Moto" -> 5000
        vehiculo == "Camion" -> 20000 + (tonelada * 2000)
      end

      Util.show_message("Vehículo #{placa} (#{vehiculo}) debe pagar $#{Util.format_price (tarifa)}")

  end
end
Vehiculo_peaje.registrar_vehiculo()
