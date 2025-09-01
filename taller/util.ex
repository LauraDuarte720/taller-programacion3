defmodule Util do

  @moduledoc """
    Funciones de utilidad para entrada/salida y formateo de datos.
  """

  @doc """
    Muestra un mensaje usando el programa Java `Mensaje`.

    ## Parámetros
      - 'message': Texto a mostrar al usuario
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  @doc """
    Solicita una entrada de texto al usuario y la retorna como `string`.

    ## Parámetros
      - 'mensaje': Texto que se muestra al usuario para solicitar la entrada
  """
  def input(message, :string) do
    System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
    |> elem(0)
    |> String.trim()

  end

  @doc """
    Solicita una entrada numérica entera al usuario, en caso de error,
    vuelve a solicitar el dato.

    ## Parámetros
      - 'mensaje': Texto que se muestra al usuario para solicitar la entrada
  """
  def input(message, :integer) do
    try do
      message
      |> input(:string)
      |> String.to_integer()
    rescue
      ArgumentError ->
        show_message( "Error: El valor ingresado no es un entero válido.")

      message
      |> input(:integer)
    end
  end

  @doc """
    Solicita una entrada numérica decimal (float) al usuario, en caso de error,
    vuelve a solicitar el dato.

    ## Parámetros
      - 'mensaje': Texto que se muestra al usuario para solicitar la entrada
  """
  def input(message, :float) do
    try do
      message
      |>input(:string)
      |>String.to_float()

    rescue
      ArgumentError ->
        show_message("Error: El valor ingresado no es un decimal valido.")

        message
      |> input(:float)
    end

  end

  @doc """
    Da formato de precio a un número flotante con dos decimales y separadores de miles.

    ## Parámetros
      - 'number': Numero decimal al cual se le va a aplicar el formato
  """
  def format_price(number) when is_float(number) do
    number
    |> :erlang.float_to_binary([decimals: 2])
    |> String.replace(~r/(?<=\d)(?=(\d{3})+(\.|,))/, ",")
  end

  @doc """
    Da formato de precio a un número entero con separadores de miles.

    ## Parámetros
      - 'number': Numero entero al cual se le va a aplicar el formato
  """
  def format_price(number) when is_integer(number) do
    number
    |> Integer.to_string()
    |> String.replace(~r/(?<=\d)(?=(\d{3})+$)/, ",")
  end

  @doc """
    Pide una cadena al usuario y valida que esta esté dentro de la lista permitida

    ## Parámetros
      - 'lista': Lista que contiene los valores aceptables
      - 'mensaje': Texto que se muestra al usuario para solicitar la entrada
  """
  def pedir_tipo(lista, mensaje, mensaje_error) do
    tipo_envio = Util.input(mensaje, :string)
    |>String.capitalize()

    if tipo_envio not in lista do
      Util.show_message("Por favor ingrese un tipo válido")
      pedir_tipo(lista, mensaje)
    else
      tipo_envio
      end
  end


end
