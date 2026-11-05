defmodule Descuento do

  def main do
    precio = leer_precio()
    descuento = obtener_descuento(precio)
    precio_final = calcular_descuento(precio, descuento)

    generar_mensaje(precio, descuento, precio_final)
    |> imprimir()
  end


  defp obtener_descuento(precio) do
    cond do
    precio <= 50000 -> 0
    precio <= 100000 -> 0.05
    precio <= 500000 -> 0.1
    true -> 0.15
    end
  end
  #Otra forma de anidar funciones
#defp obtener_descuento(precio) when precio > 50000 and precio <= 100000, do: 0.05
#defp obtener_descuento(precio) when precio > 100000 and precio <= 500000, do: 0.1
#defp obtener_descuento(precio) when precio > 500000, do: 0.15
#defp obtener_descuento(_), do: 0.0


  defp calcular_descuento(precio, descuento), do: precio - precio * descuento

  defp generar_mensaje(precio, descuento, precio_final) do
    "El precio original es: #{precio}, el descuento aplicado es: #{descuento * 100}%, y el precio final es: #{precio_final}"
  end

  def imprimir(mensaje) do
    IO.puts(mensaje)
  end

  defp leer_precio do
    IO.gets("Ingrese el valor de la compra: ")
    |> String.trim()
    |> String.to_float()
  end

end

Descuento.main()
