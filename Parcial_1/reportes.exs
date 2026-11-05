defmodule Reportes do
  @moduledoc """
  Construye el texto de cada reporte. Ninguna función de este módulo
  imprime nada: todas devuelven una cadena que `Programa` se encarga de
  mostrar.
  """

  @orden_motivos [
    :recolector_desconocido,
    :lote_desconocido,
    :dia_invalido,
    :kilos_fuera_de_rango,
    :porcentaje_invalido
  ]

  # ---------------------------------------------------------------------
  # R1
  # ---------------------------------------------------------------------
  def reporte_rechazados(rechazados) do
    detalle =
      rechazados
      |> Enum.map(fn {pesaje, motivo} ->
        "#{pesaje.recolector} | #{pesaje.lote} | día #{pesaje.dia} | " <>
          "#{Util.formatear_numero(pesaje.kilos)} kg | #{Util.formatear_numero(pesaje.verdes)} % -> #{motivo}"
      end)
      |> Enum.join("\n")

    conteos = Enum.frequencies_by(rechazados, fn {_pesaje, motivo} -> motivo end)

    resumen =
      @orden_motivos
      |> Enum.map(fn motivo -> "#{motivo}: #{Map.get(conteos, motivo, 0)}" end)
      |> Enum.join("\n")

    """
    R1. Pesajes rechazados
    #{detalle}

    Rechazos por motivo
    #{resumen}\
    """
  end

  # ---------------------------------------------------------------------
  # R2
  # ---------------------------------------------------------------------
  def reporte_kilos_por_lote(lotes, pesajes_validos) do
    kilos_por_lote = kilos_por(pesajes_validos, & &1.lote)

    filas =
      lotes
      |> Enum.map(fn lote ->
        kilos = Map.get(kilos_por_lote, lote.id, 0)
        rendimiento = kilos / lote.hectareas
        {lote, kilos, rendimiento}
      end)
      |> Enum.sort_by(fn {_lote, _kilos, rendimiento} -> rendimiento end, :desc)
      |> Enum.map(fn {lote, kilos, rendimiento} ->
        "#{lote.nombre} | #{Util.formatear_numero(kilos)} kg | #{Util.formatear_numero(lote.hectareas)} ha | " <>
          "#{Util.formatear_decimal(rendimiento)} kg/ha"
      end)
      |> Enum.join("\n")

    "R2. Kilos por lote\n" <> filas
  end

  # ---------------------------------------------------------------------
  # R3
  # ---------------------------------------------------------------------
  def kilos_por_dia(pesajes_validos), do: kilos_por(pesajes_validos, & &1.dia)

  def reporte_kilos_por_dia(pesajes_validos) do
    kilos_dia = kilos_por_dia(pesajes_validos)
    meta = Parametros.meta_diaria_kilos()

    filas =
      Parametros.rango_dias()
      |> Enum.map(fn dia ->
        kilos = Map.get(kilos_dia, dia, 0)
        estado = if kilos >= meta, do: "cumplió la meta", else: "no cumplió la meta"
        "Día #{dia}: #{Util.formatear_numero(kilos)} kg -> #{estado}"
      end)
      |> Enum.join("\n")

    cumplio_todos = Enum.all?(Parametros.rango_dias(), &(Map.get(kilos_dia, &1, 0) >= meta))
    cumplio_alguno = Enum.any?(Parametros.rango_dias(), &(Map.get(kilos_dia, &1, 0) >= meta))

    """
    R3. Kilos por día (meta: #{meta} kg)
    #{filas}
    ¿Se cumplió la meta todos los días? #{si_no(cumplio_todos)}
    ¿Se cumplió la meta al menos un día? #{si_no(cumplio_alguno)}\
    """
  end

  # ---------------------------------------------------------------------
  # R4
  # ---------------------------------------------------------------------
  def reporte_liquidacion(liquidaciones) do
    filas =
      liquidaciones
      |> Enum.sort_by(& &1.neto, :desc)
      |> Enum.with_index(1)
      |> Enum.map(fn {liq, indice} ->
        "#{indice}. | #{liq.nombre} | #{Util.formatear_numero(liq.kilos)} kg | " <>
          "$#{Util.formatear_decimal(liq.suma_pesajes)} | $#{Util.formatear_decimal(liq.bonificaciones)} | " <>
          "$#{Util.formatear_decimal(liq.alimentacion)} | $#{Util.formatear_decimal(liq.neto)}"
      end)
      |> Enum.join("\n")

    "R4. Liquidación de la semana\n" <>
      "# | Recolector | Kilos | Pesajes | Bonificaciones | Alimentación | Neto\n" <> filas
  end

  # ---------------------------------------------------------------------
  # R5
  # ---------------------------------------------------------------------
  def reporte_mejor_recolector_dia(pesajes_validos, recolectores_por_codigo) do
    kilos_por_recolector_dia =
      Enum.reduce(pesajes_validos, %{}, fn pesaje, acc ->
        Map.update(acc, {pesaje.recolector, pesaje.dia}, pesaje.kilos, &(&1 + pesaje.kilos))
      end)

    mejores_por_dia =
      Enum.map(Parametros.rango_dias(), fn dia -> {dia, mejores_del_dia(kilos_por_recolector_dia, dia)} end)

    filas =
      mejores_por_dia
      |> Enum.map(&fila_mejor_dia(&1, recolectores_por_codigo))
      |> Enum.join("\n")

    "R5. Mejor recolector de cada día\n" <>
      filas <> "\n" <> resumen_mejor_general(mejores_por_dia, recolectores_por_codigo)
  end

  defp mejores_del_dia(kilos_por_recolector_dia, dia) do
    del_dia = Enum.filter(kilos_por_recolector_dia, fn {{_r, d}, _k} -> d == dia end)

    case del_dia do
      [] ->
        []

      entradas ->
        maximo = entradas |> Enum.map(fn {_clave, kilos} -> kilos end) |> Enum.max()

        entradas
        |> Enum.filter(fn {_clave, kilos} -> kilos == maximo end)
        |> Enum.map(fn {{recolector, _dia}, kilos} -> {recolector, kilos} end)
    end
  end

  defp fila_mejor_dia({dia, []}, _recolectores_por_codigo), do: "Día #{dia}: sin pesajes"

  defp fila_mejor_dia({dia, mejores}, recolectores_por_codigo) do
    nombres =
      mejores
      |> Enum.map(fn {codigo, _kilos} -> Map.fetch!(recolectores_por_codigo, codigo).nombre end)
      |> Enum.join(", ")

    {_codigo, kilos} = hd(mejores)
    "Día #{dia}: #{nombres} (#{Util.formatear_numero(kilos)} kg)"
  end

  defp resumen_mejor_general(mejores_por_dia, recolectores_por_codigo) do
    conteos =
      mejores_por_dia
      |> Enum.flat_map(fn {_dia, mejores} -> Enum.map(mejores, fn {codigo, _kilos} -> codigo end) end)
      |> Enum.frequencies()

    if map_size(conteos) == 0 do
      "Más días como mejor recolector: sin datos"
    else
      maximo_dias = conteos |> Map.values() |> Enum.max()

      nombres =
        conteos
        |> Enum.filter(fn {_codigo, dias} -> dias == maximo_dias end)
        |> Enum.map(fn {codigo, _dias} -> Map.fetch!(recolectores_por_codigo, codigo).nombre end)
        |> Enum.join(", ")

      "Más días como mejor recolector: #{nombres} (#{maximo_dias} días)"
    end
  end

  # ---------------------------------------------------------------------
  # R6
  # ---------------------------------------------------------------------
  def reporte_mejor_calidad(recolectores, pesajes_validos) do
    pesajes_por_recolector = Enum.group_by(pesajes_validos, & &1.recolector)

    candidatos =
      recolectores
      |> Enum.map(fn recolector -> {recolector, Map.get(pesajes_por_recolector, recolector.codigo, [])} end)
      |> Enum.filter(fn {_recolector, pesajes} -> length(pesajes) >= 3 end)
      |> Enum.map(fn {recolector, pesajes} -> {recolector, verdes_ponderado(pesajes)} end)

    cuerpo =
      case candidatos do
        [] ->
          "Ningún recolector tiene al menos 3 pesajes válidos."

        lista ->
          {mejor, porcentaje} = Enum.min_by(lista, fn {_recolector, porcentaje} -> porcentaje end)
          "#{mejor.nombre}, con #{Util.formatear_decimal(porcentaje)} % de verdes ponderado por kilos"
      end

    "R6. Mejor calidad (mínimo 3 pesajes válidos)\n" <> cuerpo
  end

  defp verdes_ponderado(pesajes) do
    kilos_totales = pesajes |> Enum.map(& &1.kilos) |> Enum.sum()
    suma_ponderada = pesajes |> Enum.map(&(&1.verdes * &1.kilos)) |> Enum.sum()
    suma_ponderada / kilos_totales
  end

  # ---------------------------------------------------------------------
  # R7
  # ---------------------------------------------------------------------
  def reporte_totales(liquidaciones, pesajes_validos) do
    total_pagado = liquidaciones |> Enum.map(& &1.neto) |> Enum.sum()
    kilos_validos = pesajes_validos |> Enum.map(& &1.kilos) |> Enum.sum()
    costo_promedio = if kilos_validos > 0, do: total_pagado / kilos_validos, else: 0

    """
    R7. Totales de la semana
    Total a pagar: $#{Util.formatear_decimal(total_pagado)}
    Kilos válidos: #{Util.formatear_numero(kilos_validos)} kg
    Costo promedio por kilo: $#{Util.formatear_decimal(costo_promedio)}\
    """
  end

  # ---------------------------------------------------------------------
  # R8
  # ---------------------------------------------------------------------
  def reporte_todos_los_lotes(recolectores, lotes, pesajes_validos) do
    ids_lotes = MapSet.new(lotes, & &1.id)

    lotes_por_recolector =
      Enum.reduce(pesajes_validos, %{}, fn pesaje, acc ->
        Map.update(acc, pesaje.recolector, MapSet.new([pesaje.lote]), &MapSet.put(&1, pesaje.lote))
      end)

    calificados =
      recolectores
      |> Enum.filter(fn recolector ->
        lotes_del_recolector = Map.get(lotes_por_recolector, recolector.codigo, MapSet.new())
        MapSet.subset?(ids_lotes, lotes_del_recolector)
      end)
      |> Enum.map(& &1.nombre)

    cuerpo =
      case calificados do
        [] -> "Ningún recolector trabajó en todos los lotes."
        nombres -> Enum.join(nombres, "\n")
      end

    "R8. Recolectores que trabajaron en todos los lotes\n" <> cuerpo
  end

  # ---------------------------------------------------------------------
  # Desprendible de pago (B.5)
  # ---------------------------------------------------------------------
  def desprendible(recolector, pesajes_validos_recolector, liquidacion) do
    detalle = Liquidacion.detalle_por_dia(pesajes_validos_recolector)

    filas =
      detalle
      |> Enum.map(fn %{dia: dia, kilos: kilos, valor_pesajes: valor_pesajes, bonificacion: bonificacion} ->
        "Día #{dia}: #{Util.formatear_numero(kilos)} kg | pesajes $#{Util.formatear_decimal(valor_pesajes)} | " <>
          "bonificación $#{Util.formatear_decimal(bonificacion)}"
      end)
      |> Enum.join("\n")

    """
    Desprendible de pago - #{recolector.nombre} (#{recolector.codigo})
    #{filas}
    Suma de pesajes: $#{Util.formatear_decimal(liquidacion.suma_pesajes)}
    Bonificaciones: $#{Util.formatear_decimal(liquidacion.bonificaciones)}
    Alimentación (#{length(detalle)} días): -$#{Util.formatear_decimal(liquidacion.alimentacion)}
    Neto a pagar: $#{Util.formatear_decimal(liquidacion.neto)}\
    """
  end

  # ---------------------------------------------------------------------
  # Parte C.1: ranking con opciones (keyword list)
  # ---------------------------------------------------------------------
  def ranking(liquidaciones, opciones \\ []) do
    campo = Keyword.get(opciones, :campo, :neto)
    orden = Keyword.get(opciones, :orden, :desc)
    limite = Keyword.get(opciones, :limite, length(liquidaciones))

    liquidaciones
    |> Enum.map(fn liq -> {liq, valor_campo(liq, campo)} end)
    |> Enum.sort_by(fn {_liq, valor} -> valor end, orden)
    |> Enum.take(limite)
    |> Enum.with_index(1)
    |> Enum.map(fn {{liq, valor}, indice} ->
      "#{indice}. #{liq.nombre} (#{campo}: #{formatear_valor_campo(valor, campo)})"
    end)
    |> Enum.join("\n")
  end

  defp valor_campo(liq, :neto), do: liq.neto
  defp valor_campo(liq, :kilos), do: liq.kilos
  defp valor_campo(liq, :bruto), do: liq.suma_pesajes + liq.bonificaciones

  defp formatear_valor_campo(valor, :kilos), do: Util.formatear_numero(valor)
  defp formatear_valor_campo(valor, _otro), do: "$" <> Util.formatear_decimal(valor)

  # ---------------------------------------------------------------------
  # Parte C.2: combinar el reporte de kilos por día con otra finca
  # ---------------------------------------------------------------------
  def combinar_kilos_dia(kilos_finca, kilos_finca_vecina) do
    Map.merge(kilos_finca, kilos_finca_vecina, fn _dia, kilos_propios, kilos_vecinos ->
      kilos_propios + kilos_vecinos
    end)
  end

  # ---------------------------------------------------------------------
  # Auxiliares privados
  # ---------------------------------------------------------------------
  defp kilos_por(pesajes_validos, funcion_clave) do
    Enum.reduce(pesajes_validos, %{}, fn pesaje, acc ->
      Map.update(acc, funcion_clave.(pesaje), pesaje.kilos, &(&1 + pesaje.kilos))
    end)
  end

  defp si_no(true), do: "Sí"
  defp si_no(false), do: "No"
end
