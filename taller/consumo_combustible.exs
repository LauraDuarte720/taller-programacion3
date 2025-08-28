defmodule Consumo_combustible do

  def calcular_consumo_combustible()do
    nombre = Util.input("Ingrese el nombre del conductor", :String)
    distancia = Util.input("Ingrese la distancia recorrida en km", :float)
    combustible = Util.input("Ingrese la cantidad de combustible consumido en litros:", :float)
    rendimiento = distancia/combustible

    "El rendimiento del vehciulo del conductor #{nombre} es de #{Float.round(rendimiento,2)}"
    |> Util.show_message()
  end

end
Consumo_combustible.calcular_consumo_combustible()
