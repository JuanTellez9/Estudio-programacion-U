defmodule Videojuego do
  def main do
    leer_nombre()
    |>saludar()
    |> imprimir_mensaje()
  end

  defp saludar(nombre) do
    "Bienvenido #{nombre}, al videojuego"
  end

  defp imprimir_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  defp leer_nombre do
    IO.gets("Por favor, ingrese su nombre:")
    |> String.trim()
  end
end

Videojuego.main()
