defmodule  Calculo_paquete do

  @moduledoc """
    Módulo para ingresar los datos de un paquete y calcular su envío
    según el tipo de envío y peso.
  """


@doc """
    Solicita el nombre del usuario, y el peso y tipo de envío del paquete
    Calcula el precio del envío segun el peso y tipo y retorna un tupla con todos los datos
    Se imprimen los valores de la tupla en pantalla para verificar el funcionamiento del programa
  """
  def calcular_envio do
    nombre = Util.input("Ingrese su nombre: ", :string)
    peso = Util.input("Ingrese el peso del paquete: ", :float)
    tipo_envio = pedir_tipo(["Economico", "Express", "Internacional"], "Ingrese el tipo de envío (Economico, Express, Internacional): ")
    tarifa = aplicar_tarifa(tipo_envio, peso)
    precio_total = peso * tarifa
    tupla = {nombre, "#{peso} kg", tipo_envio, "$ #{Util.format_price(precio_total)}"}
    tupla
    |> Tuple.to_list()
    |> Enum.each(&IO.puts/1)
    tupla
  end


@doc """
    Pide una cadena al usuario y valida que esta esté dentro de la lista permitida

    ## Parámetros
      - 'lista': Lista que contiene los valores aceptables
      - 'mensaje': Texto que se muestra al usuario para solicitar la entrada
  """
  def pedir_tipo(lista, mensaje) do
    tipo_envio = Util.input(mensaje, :string)
    |>String.capitalize()

    if tipo_envio not in lista do
      Util.show_message("Por favor ingrese un tipo válido")
      pedir_tipo(lista, mensaje)
    else
      tipo_envio
      end
  end


  @doc """
    Determina el valor de la tarifa de acuerdo al tipo de envio por medio de pattern mathing

    ## Parámetros
      - 'tipo_envio': Tipo de envío seleccionado
      - 'peso': Peso del paquete en kilogramos
  """
  def aplicar_tarifa(tipo_envio, peso) do
    case tipo_envio do
      "Economico" -> 5000
      "Express" -> 8000
      "Internacional" -> aplicar_tarifa_peso(peso)

    end
  end

   @doc """
    Determina el valor de la tarifa de acuerdo al peso del paquete

    ## Parámetros
      - 'peso': Peso del paquete en kilogramos
  """
  def aplicar_tarifa_peso(peso) do
    cond do
      peso <= 5 -> 15000
      peso > 5 -> 12000
    end
  end
end

Calculo_paquete.calcular_envio()
