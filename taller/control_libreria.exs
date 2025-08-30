defmodule Control_libreria do

  @moduledoc """
  Módulo para registrar libros y calcular el valor total en inventario.
  """

  @doc """
  Registra un libro y muestra el valor total de su inventario a partir de las
  unidades y precio unitario
  """
  def registrar_libro do
    titulo = Util.input("Ingrese el título del libro: ", :string)
    unidades = Util.input("Ingrese la cantidad de unidades disponibles: ", :integer)
    precio_unitario = Util.input("Ingrese el precio unitario: ", :float)
    valor_inventario = unidades * precio_unitario
    Util.show_message("El libro #{titulo} tiene #{unidades} unidades, con un valor total de $#{Util.format_price(valor_inventario)}")
  end
end

Control_libreria.registrar_libro()
