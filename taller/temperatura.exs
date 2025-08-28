defmodule Conversion_temperatura do

  def convertir_temperatura() do
    usuario = Util.input("Ingrese su nombre:", :String)
    temperatura = Util.input("Ingrese la temperatura en °C:", :float)
    farenheint = (temperatura *9/5) + 32
    kelvin = temperatura + 273.15

    "#{usuario}, la temperatura es:\n- #{Float.round(farenheint,1)} °F\n- #{Float.round(kelvin,1)} K"
    |>Util.show_message()
  end

end
Conversion_temperatura.convertir_temperatura()
