defmodule Ventas do
  def main do
    ventas = ventas_del_dia()
    categoria= obtener_categorias_unicas(ventas)
    IO.inspect(categoria, label: "Las categorias son ")

    vent= productos_vendidos(ventas)
    IO.inspect(vent)


  end
  def ventas_del_dia do
    [
      %{producto: "Café", categoria: "Bebidas", cantidad: 3, precio: 4000},
      %{producto: "Té", categoria: "Bebidas", cantidad: 1, precio: 3500},
      %{producto: "Jugo", categoria: "Bebidas", cantidad: 6, precio: 5000},
      %{producto: "Pan", categoria: "Panadería", cantidad: 5, precio: 2000},
      %{producto: "Croissant", categoria: "Panadería", cantidad: 2, precio: 4500},
      %{producto: "Torta", categoria: "Panadería", cantidad: 1, precio: 25000},
      %{producto: "Galleta", categoria: "Panadería", cantidad: 3, precio: 1500}
    ]
  end
  def obtener_categorias_unicas(ventas) do
    Enum.map(ventas, fn venta -> venta.categoria  end)
    |>Enum.uniq()
  end

  def productos_vendidos(ventas) do
    Enum.group_by(ventas, fn venta -> venta.categoria end, fn venta -> venta.producto end)
  end

  def contar_ventas(ventas) do
     Enum.group_by(ventas, fn venta -> venta.categoria end, fn venta -> venta.producto end)
     |>Enum.count()
  end
end
Ventas.main()
