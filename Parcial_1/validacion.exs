defmodule Validacion do
  @moduledoc """
  Reglas de validación de los pesajes. Todas las funciones de este módulo
  son puras: no leen del teclado ni imprimen nada.
  """

  @doc """
  Valida un pesaje contra las 5 reglas de negocio, en orden, y se detiene
  en la primera que falle. Recibe además los índices de recolectores y
  lotes (mapas código/id -> dato) para poder verificar su existencia.

  Devuelve `{:ok, pesaje}` si pasa todas las reglas, o
  `{:error, motivo, pesaje}` con el motivo de la primera regla que falló.
  """
  def validar_pesaje(pesaje, recolectores_por_codigo, lotes_por_id) do
    with {:ok, _} <- validar_recolector(pesaje, recolectores_por_codigo),
         {:ok, _} <- validar_lote(pesaje, lotes_por_id),
         {:ok, _} <- validar_dia(pesaje),
         {:ok, _} <- validar_kilos(pesaje),
         {:ok, _} <- validar_verdes(pesaje) do
      {:ok, pesaje}
    else
      {:error, motivo} -> {:error, motivo, pesaje}
    end
  end

  defp validar_recolector(pesaje, recolectores_por_codigo) do
    if Map.has_key?(recolectores_por_codigo, pesaje.recolector) do
      {:ok, pesaje}
    else
      {:error, :recolector_desconocido}
    end
  end

  defp validar_lote(pesaje, lotes_por_id) do
    if Map.has_key?(lotes_por_id, pesaje.lote) do
      {:ok, pesaje}
    else
      {:error, :lote_desconocido}
    end
  end

  defp validar_dia(pesaje) do
    if is_integer(pesaje.dia) and pesaje.dia in Parametros.rango_dias() do
      {:ok, pesaje}
    else
      {:error, :dia_invalido}
    end
  end

  defp validar_kilos(pesaje) do
    if numero?(pesaje.kilos) and pesaje.kilos > 0 and
         pesaje.kilos <= Parametros.max_kilos_pesaje() do
      {:ok, pesaje}
    else
      {:error, :kilos_fuera_de_rango}
    end
  end

  defp validar_verdes(pesaje) do
    if numero?(pesaje.verdes) and pesaje.verdes >= 0 and pesaje.verdes <= 100 do
      {:ok, pesaje}
    else
      {:error, :porcentaje_invalido}
    end
  end

  defp numero?(valor), do: is_integer(valor) or is_float(valor)

  @doc """
  Interpreta la línea que escribe el usuario para agregar un pesaje
  adicional, con el formato "recolector;lote;dia;kilos;verdes".

  Devuelve `{:ok, pesaje}` si el formato es correcto (independientemente
  de si luego pasa las reglas de negocio), o `{:error, :formato_invalido}`
  si la línea no tiene 5 campos, el día no es un entero, o los kilos o los
  verdes no son números.
  """
  def parsear_linea_pesaje(linea) do
    with [recolector, lote, dia_texto, kilos_texto, verdes_texto] <-
           String.split(linea, ";"),
         {dia, ""} <- Integer.parse(dia_texto),
         {kilos, ""} <- Float.parse(kilos_texto),
         {verdes, ""} <- Float.parse(verdes_texto) do
      {:ok, %{recolector: recolector, lote: lote, dia: dia, kilos: kilos, verdes: verdes}}
    else
      _ -> {:error, :formato_invalido}
    end
  end
end
