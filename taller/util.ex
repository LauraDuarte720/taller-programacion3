defmodule Util do

  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  def input(message, :String) do
    System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
    |> elem(0)
    |> String.trim()

  end

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


  def input(message, :float) do
    try do
      message
      |>input(:string)
      |>String.to_float()
    end
  rescue
    ArgumentError ->
      show_message("Error: El valor ingresado no es un decimal valido.")

      message
      |> input(:float)
  end

end
