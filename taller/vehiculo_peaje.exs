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
      Util.input("Ingrese la placa del vehiculo: ", :String)
      |> String.upcase()
    vehiculo =
      Util.input("Ingrese el tipo de vehículo: ", :String)
      |> String.capitalize()
    tonelada = Util.input("Ingrese el peso del vehículo (toneladas): ", :float)

    tarifa =
      cond do
        vehiculo == "Carro" -> 10000
        vehiculo == "Moto" -> 5000
        vehiculo == "Camion" -> 20000 + (tonelada * 2000)
        true -> 0
      end

    cond do
      tarifa == 0 ->
        Util.show_message("El tipo de vehículo no existe, reintente de nuevo")
        registrar_vehiculo()
      true -> Util.show_message("Vehículo #{placa} (#{vehiculo}) debe pagar #{Util.format_price (tarifa)}")

    end
  end

end
Vehiculo_peaje.registrar_vehiculo()
