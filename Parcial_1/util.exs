defmodule Util do
  @moduledoc """
  Funciones de entrada/salida y de formato de números.

  Junto con `Programa`, es el único módulo del proyecto donde puede haber
  funciones impuras (que leen del teclado o escriben en la consola).
  """

  @doc """
  Lee un valor desde la consola según el tipo pedido:
  - `:string` -> quita espacios sobrantes.
  - `:integer` -> convierte a entero; si no es válido, usa 0.
  - `:float` -> convierte a decimal; si no es válido, usa 0.0.
  """
  def leer(mensaje, :string) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def leer(mensaje, :integer) do
    leer_con_parser(mensaje, &Integer.parse/1, 0)
  end

  def leer(mensaje, :float) do
    leer_con_parser(mensaje, &Float.parse/1, 0.0)
  end

  defp leer_con_parser(mensaje, funcion_parseo, valor_por_defecto) do
    resultado =
      mensaje
      |> IO.gets()
      |> String.trim()
      |> funcion_parseo.()

    case resultado do
      {numero, _resto} ->
        numero

      :error ->
        imprimir_mensaje(
          "Entrada inválida. Se utilizará #{valor_por_defecto} como valor predeterminado."
        )

        valor_por_defecto
    end
  end

  @doc "Imprime un mensaje en la consola."
  def imprimir_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  @doc """
  Da formato de dinero a un número: dos decimales y sin notación científica.
  Sirve tanto para enteros como para decimales.
  """
  def formatear_decimal(valor, decimales \\ 2) do
    :erlang.float_to_binary(valor * 1.0, decimals: decimales)
  end

  @doc """
  Da formato a un número que no es dinero (kilos, porcentajes): conserva
  la cantidad de decimales natural del valor, pero evita que Elixir lo
  muestre en notación científica cuando es un decimal "redondo" (ej. 1000.0).
  """
  def formatear_numero(valor) when is_integer(valor), do: Integer.to_string(valor)

  def formatear_numero(valor) when is_float(valor) do
    texto = Float.to_string(valor)

    if String.contains?(texto, "e") do
      valor
      |> :erlang.float_to_binary(decimals: 10)
      |> String.trim_trailing("0")
      |> String.trim_trailing(".")
    else
      texto
    end
  end
end
