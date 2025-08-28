defmodule Control_libreria do
  def registrar_libro do
    titulo = Util.input("Ingrese el título del libro: ", :String)
    unidades = Util.input("Ingrese la cantidad de unidades disponibles: ", :integer)
    precio_unitario = Util.input("Ingrese el precio unitario: ", :float)
    valor_inventario = unidades * precio_unitario
    Util.show_message("El libro #{titulo} tiene #{unidades} unidades, con un valor total de $#{Util.format_price(valor_inventario)}")
  end
end

Control_libreria.registrar_libro()
