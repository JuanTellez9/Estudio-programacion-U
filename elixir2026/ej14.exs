defmodule Tienda do
  def main do
    lista = productos()

    total_inventario = valor_total_inventario(lista)
    IO.puts("Total del inventario:#{total_inventario}")
    productoSinStok = productoa_sin_stock(lista)
    IO.puts("Productos sin stock:#{productoSinStok}")
    filtrarAccesorios = filtrar_accesorios(lista)
    IO.puts("Filtrado por accesorio:")

    filtrarAccesorios
    |> Enum.each(fn producto ->
      IO.puts("#{producto.nombre} - $#{producto.precio}")
    end)

    {mas_caro, mas_barato} = caro_barato(lista)

    IO.puts("\nProducto más caro y más barato:")
    IO.inspect(mas_caro)
    IO.inspect(mas_barato)

    agruparCategorias = agrupar_categoria(lista)
    IO.inspect(agruparCategorias, label: "Agrupacion por categoria")
    IO.puts("\nProductos por categoría:")

    IO.inspect(contar_por_categoria(lista))

    IO.puts("\nPromedio de precios por categoría:")
    IO.inspect(promedio_por_categoria(lista))
  end

  def productos do
    [
      %{id: 1, nombre: "Teclado mecánico", precio: 180_000, stock: 12, categoria: "Periféricos"},
      %{id: 2, nombre: "Mouse inalámbrico", precio: 75000, stock: 0, categoria: "Periféricos"},
      %{id: 3, nombre: "Monitor 24\"", precio: 620_000, stock: 5, categoria: "Pantallas"},
      %{id: 4, nombre: "Cable HDMI", precio: 25000, stock: 40, categoria: "Accesorios"},
      %{id: 5, nombre: "Base para portátil", precio: 90000, stock: 0, categoria: "Accesorios"},
      %{id: 6, nombre: "Audífonos", precio: 150_000, stock: 8, categoria: "Accesorios"},
      %{id: 7, nombre: "Monitor 27\"", precio: 950_000, stock: 3, categoria: "Pantallas"}
    ]
  end

  def valor_total_inventario(lista) do
    Enum.reduce(lista, 0, fn producto, acc ->
      acc + producto.precio * producto.stock
    end)
  end

  def productoa_sin_stock(lista) do
    Enum.filter(lista, fn producto -> producto.stock == 0 end)
    |> Enum.map(fn productos -> productos.nombre end)
    |> Enum.join(", ")
  end

  def filtrar_accesorios(lista) do
    Enum.filter(lista, fn productos -> productos.categoria == "Accesorios" end)
    |> Enum.sort_by(fn productos -> productos.precio end, :asc)
  end

  def caro_barato(lista) do
    caro = Enum.max_by(lista, fn producto -> producto.precio end)
    barato = Enum.min_by(lista, fn producto -> producto.precio end)

    {{:mas_caro, caro.nombre, caro.precio}, {:mas_barato, barato.nombre, barato.precio}}
  end

  def agrupar_categoria(lista) do
    Enum.group_by(lista, fn producto -> producto.categoria end, fn producto -> producto.nombre end)
  end

  def contar_por_categoria(lista) do
    lista
    |> Enum.group_by(fn producto -> producto.categoria end)
    |> Enum.map(fn {categoria, productos} -> {categoria, length(productos)} end)
    |> Map.new()
  end

  def promedio_por_categoria(lista) do
    lista
    |> Enum.group_by(fn producto -> producto.categoria end)
    |> Enum.map(fn {categoria, productos} ->
      suma = Enum.reduce(productos, 0, fn producto, acc -> acc + producto.precio end)
      {categoria, suma / length(productos)}
    end)
    |> Map.new()
  end
end

Tienda.main()
