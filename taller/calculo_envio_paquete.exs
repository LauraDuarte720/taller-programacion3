defmodule  Calculo_paquete do
  def calcular_envio do
    nombre = Util.input("Ingrese su nombre: ", :string)
    peso = Util.input("Ingrese el peso del paquete: ", :float)
    tipo_envio = pedir_tipo(["Economico", "Express", "Internacional"], "Ingrese el tipo de envío (Economico, Express, Internacional): ")
    tarifa = aplicar_tarifa(tipo_envio, peso)
    precio_total = peso * tarifa
    tupla = {nombre, "#{peso} kg", tipo_envio, "$ #{Util.format_price(precio_total)}"}
    tupla
    |> Tuple.to_list()
    |> Enum.each(&Util.show_message/1)
  end



  defp pedir_tipo(lista, mensaje) do
    tipo_envio = Util.input(mensaje, :string)
    |>String.capitalize()

    if tipo_envio not in lista do
      Util.show_message("Por favor ingrese un tipo válido")
      pedir_tipo(lista, mensaje)
    else
      tipo_envio
      end
  end

  defp aplicar_tarifa(tipo_envio, peso) do
    case tipo_envio do
      "Economico" -> 5000
      "Express" -> 8000
      "Internacional" -> aplicar_tarifa_peso(peso)

    end
  end

  defp aplicar_tarifa_peso(peso) do
    cond do
      peso <= 5 -> 15000
      peso > 5 -> 12000
    end
  end
end

Calculo_paquete.calcular_envio()
