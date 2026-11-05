defmodule Tienda do
  def main do
    siOno = leer_datos("¿Eres estudiante? (si/no): ")
    precio = leer_precio("Digite el precio del producto: ")

    precio_con_descuento = descuentoEsOEm(siOno, precio)

    precio_con_descuento
    |> generar_mensaje()
    |> imprimir_mensaje()
  end

  def descuentoEsOEm(siOno, precio) do
    if siOno == "si" do
      crear_descuento(precio, 20)   # 20% descuento
    else
      crear_descuento(precio, 35)   # 35% descuento
    end
  end

  def crear_descuento(precio, porcentaje) do
    descuento = div(precio * porcentaje,100)
    precio - descuento
  end

  def generar_mensaje(precio) do
    "El precio del producto con descuento es: #{precio}"
  end

  def imprimir_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def leer_datos(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def leer_precio(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
    |> String.to_integer()
  end
end

Tienda.main()
