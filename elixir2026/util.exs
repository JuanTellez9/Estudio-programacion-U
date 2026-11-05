defmodule Util do
  @moduledoc """
  Módulo de utilidades para manejo de entrada/salida (guías 05, 06 y 08).
  Se compila una sola vez con: elixirc util.exs
  """
  def leer(mensaje, :string) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def leer(mensaje, :integer), do: leer_con_parser(mensaje, &Integer.parse/1)
  def leer(mensaje, :float), do: leer_con_parser(mensaje, &Float.parse/1)

  defp leer_con_parser(mensaje, funcion) do
    valor =
      IO.gets(mensaje)
      |> String.trim()
      |> funcion.()

    case valor do
      # Caso base: el usuario escribió un número válido
      {numero, ""} ->
        numero

      # Caso recursivo: la entrada no sirve, se vuelve a preguntar (guía 08)
      _ ->
        imprimir_error("Entrada inválida. Debe escribir un número.")
        leer_con_parser(mensaje, funcion)
    end
  end

  def imprimir_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  def imprimir_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
