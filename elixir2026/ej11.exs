defmodule Cadenas do
  @moduledoc """
  Punto 1: contar las vocales de una cadena con dos funciones recursivas.

  Vocales válidas: a, e, i, o, u (mayúscula o minúscula), á, é, í, ó, ú y ü.
  Si la entrada no es una cadena, las dos funciones retornan {:error, motivo}.

  La palabra se pide por teclado con el módulo Util (guías 05, 06 y 08).
  Si lo digitado es un número (por ejemplo 123), se le pasa ese número a las
  funciones y las dos retornan {:error, :no_es_cadena}.

  - autor: (escriba aquí su nombre)
  - fecha: (escriba aquí la fecha)
  """

  # Atributo de módulo: constante con las vocales válidas (guía 06)
  @vocales [
    "a", "e", "i", "o", "u", "á", "é", "í", "ó", "ú", "ü",
    "A", "E", "I", "O", "U", "Á", "É", "Í", "Ó", "Ú", "Ü"
  ]

  def main do
    "Digite la palabra o frase para contar sus vocales: "
    |> Util.leer(:string)
    |> contar_vocales()
  end

  defp contar_vocales(texto_digitado) do
    case numero_digitado(texto_digitado) do
      # Lo digitado es un número, no una cadena de caracteres
      {:ok, numero} ->
        Util.imprimir_mensaje("Lo digitado es un número (#{numero}), no una cadena de caracteres.")
        Util.imprimir_mensaje("Implementación A: #{inspect(contar_vocales_a(numero))}")
        Util.imprimir_mensaje("Implementación B: #{inspect(contar_vocales_b(numero))}")

      # Lo digitado es una cadena de caracteres
      :error ->
        Util.imprimir_mensaje("La cadena digitada es: #{texto_digitado}")
        Util.imprimir_mensaje("Implementación A (String.graphemes/1): #{contar_vocales_a(texto_digitado)} vocales")
        Util.imprimir_mensaje("Implementación B (patrones sobre binarios): #{contar_vocales_b(texto_digitado)} vocales")
    end
  end

  # Integer.parse/1 y Float.parse/1 retornan {numero, resto} o :error (guía 05).
  # Cuando el resto es la cadena vacía, todo lo digitado era un número.
  defp numero_digitado(texto) do
    case {Integer.parse(texto), Float.parse(texto)} do
      {{numero, ""}, _} -> {:ok, numero}
      {_, {numero, ""}} -> {:ok, numero}
      _ -> :error
    end
  end

  # ------------------------------------------------------------------
  # Implementación A: usando String.graphemes/1
  # ------------------------------------------------------------------
  @doc """
  Cuenta las vocales de una cadena.

  Convierte la cadena en una lista de caracteres con String.graphemes/1 una sola vez,
  antes de iniciar la recursión, y recorre esa lista con [head | tail].

  ## Ejemplo

      iex> Cadenas.contar_vocales_a("murciélago")
      5
  """
  def contar_vocales_a(cadena) when is_binary(cadena) do
    contar_graphemes(String.graphemes(cadena), 0)
  end

  # La entrada no es una cadena: se retorna el error como un valor (guía 06)
  def contar_vocales_a(_no_es_cadena), do: {:error, :no_es_cadena}

  # Caso base: no quedan caracteres por revisar
  defp contar_graphemes([], acumulado), do: acumulado

  # Caso recursivo: el carácter es una vocal (guard con la constante @vocales)
  defp contar_graphemes([head | tail], acumulado) when head in @vocales do
    contar_graphemes(tail, acumulado + 1)
  end

  # Caso recursivo: no es vocal, se continúa con el resto
  defp contar_graphemes([_head | tail], acumulado) do
    contar_graphemes(tail, acumulado)
  end

  # ------------------------------------------------------------------
  # Implementación B: pattern matching sobre binarios
  # Sin String.graphemes/1, String.codepoints/1, String.to_charlist/1 ni String.split/2
  # ------------------------------------------------------------------
  @doc """
  Cuenta las vocales de una cadena recorriéndola byte a byte.

  No convierte la cadena en lista: en cada llamada separa el primer carácter del
  resto mediante coincidencia de patrones sobre binarios.

  ## Ejemplo

      iex> Cadenas.contar_vocales_b("murciélago")
      5
  """
  def contar_vocales_b(cadena) when is_binary(cadena), do: contar_bytes(cadena, 0)

  def contar_vocales_b(_no_es_cadena), do: {:error, :no_es_cadena}

  # Caso base: no quedan bytes por revisar
  defp contar_bytes(<<>>, acumulado), do: acumulado

  # --- Vocales con tilde y diéresis: ocupan dos bytes en UTF-8 ---
  defp contar_bytes(<<"á", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"é", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"í", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"ó", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"ú", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"ü", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"Á", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"É", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"Í", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"Ó", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"Ú", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"Ü", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)

  # --- Vocales sin tilde: ocupan un byte en UTF-8 ---
  defp contar_bytes(<<"a", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"e", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"i", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"o", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"u", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"A", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"E", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"I", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"O", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)
  defp contar_bytes(<<"U", resto::binary>>, acumulado), do: contar_bytes(resto, acumulado + 1)

  # --- Cualquier otro carácter: se descarta y se continúa ---
  defp contar_bytes(<<_otro, resto::binary>>, acumulado), do: contar_bytes(resto, acumulado)
end

Cadenas.main()
