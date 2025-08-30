defmodule Conversion_temperatura do

  @moduledoc """
    Módulo para convertir temperaturas de °C a °F y K.
  """

  @doc """
    Convierte una temperatura en grados Celsius a Fahrenheit y Kelvin.
  """
  def convertir_temperatura() do
    usuario = Util.input("Ingrese su nombre:", :string)
    temperatura = Util.input("Ingrese la temperatura en °C:", :float)
    farenheint = (temperatura *9/5) + 32
    kelvin = temperatura + 273.15

    "#{usuario}, la temperatura es:\n- #{Float.round(farenheint,1)} °F\n- #{Float.round(kelvin,1)} K"
    |>Util.show_message()
  end

end
Conversion_temperatura.convertir_temperatura()
