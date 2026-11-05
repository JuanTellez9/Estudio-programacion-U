defmodule Liquidacion do
  @moduledoc """
  Cálculo del valor de los pesajes, las bonificaciones, el descuento de
  alimentación y la liquidación final de cada recolector.
|
  Todas las funciones de este módulo son puras.
  """

  @doc "Calcula el valor de un pesaje válido, aplicando el ajuste por verdes."
  def valor_pesaje(%{kilos: kilos, verdes: verdes}) do
    kilos * Parametros.tarifa_base_por_kilo() * ajuste_por_verdes(verdes)
  end

  defp ajuste_por_verdes(verdes) when verdes <= 2, do: 1.05
  defp ajuste_por_verdes(verdes) when verdes <= 5, do: 1.0
  defp ajuste_por_verdes(verdes) when verdes <= 10, do: 0.9
  defp ajuste_por_verdes(_verdes), do: 0.7

  @doc "Bonificación de un día: aplica si ese día se llegó a la meta de kilos."
  def bonificacion_dia(kilos_del_dia) do
    if kilos_del_dia >= Parametros.kilos_para_bonificacion() do
      Parametros.bonificacion_diaria()
    else
      0
    end
  end

  @doc """
  Descuento de alimentación de un recolector: depende de si come en la
  finca y de cuántos días trabajó (días con al menos un pesaje válido).
  """
  def descuento_alimentacion(dias_trabajados, come_en_finca?) do
    if come_en_finca? do
      dias_trabajados * Parametros.descuento_alimentacion_diario()
    else
      0
    end
  end

  @doc """
  Suma los kilos válidos de una lista de pesajes, agrupados por día.
  Devuelve un mapa `%{dia => kilos_del_dia}`.
  """
  def agrupar_kilos_por_dia(pesajes) do
    Enum.reduce(pesajes, %{}, fn pesaje, acumulador ->
      Map.update(acumulador, pesaje.dia, pesaje.kilos, &(&1 + pesaje.kilos))
    end)
  end

  @doc """
  Liquida a un recolector: recibe su información y la lista de SUS
  pesajes válidos, y devuelve un mapa con el detalle de su pago semanal.
  """
  def liquidar_recolector(recolector, pesajes_validos_recolector) do
    kilos_por_dia = agrupar_kilos_por_dia(pesajes_validos_recolector)

    kilos_totales =
      pesajes_validos_recolector |> Enum.map(& &1.kilos) |> Enum.sum()

    suma_pesajes =
      pesajes_validos_recolector |> Enum.map(&valor_pesaje/1) |> Enum.sum()

    bonificaciones =
      kilos_por_dia |> Map.values() |> Enum.map(&bonificacion_dia/1) |> Enum.sum()

    dias_trabajados = kilos_por_dia |> Map.keys() |> length()
    alimentacion = descuento_alimentacion(dias_trabajados, recolector.alimentacion)
    neto = suma_pesajes + bonificaciones - alimentacion

    %{
      codigo: recolector.codigo,
      nombre: recolector.nombre,
      kilos: kilos_totales,
      suma_pesajes: suma_pesajes,
      bonificaciones: bonificaciones,
      alimentacion: alimentacion,
      neto: neto,
      kilos_por_dia: kilos_por_dia
    }
  end

  @doc """
  Desglosa los pesajes válidos de UN recolector por día: cuántos kilos,
  cuánto valieron sus pesajes y cuánta bonificación generó cada día.
  Se usa para construir su desprendible de pago.
  """
  def detalle_por_dia(pesajes_validos_recolector) do
    pesajes_validos_recolector
    |> Enum.group_by(& &1.dia)
    |> Enum.map(fn {dia, pesajes_del_dia} ->
      kilos = pesajes_del_dia |> Enum.map(& &1.kilos) |> Enum.sum()
      valor_pesajes = pesajes_del_dia |> Enum.map(&valor_pesaje/1) |> Enum.sum()

      %{dia: dia, kilos: kilos, valor_pesajes: valor_pesajes, bonificacion: bonificacion_dia(kilos)}
    end)
    |> Enum.sort_by(& &1.dia)
  end

  @doc """
  Liquida a TODOS los recolectores (incluso a los que no tienen pesajes
  válidos, que quedan con todo en cero).
  """
  def liquidar_todos(recolectores, pesajes_validos) do
    pesajes_por_recolector = Enum.group_by(pesajes_validos, & &1.recolector)

    Enum.map(recolectores, fn recolector ->
      pesajes_del_recolector = Map.get(pesajes_por_recolector, recolector.codigo, [])
      liquidar_recolector(recolector, pesajes_del_recolector)
    end)
  end
end
