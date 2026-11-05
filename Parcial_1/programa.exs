defmodule Programa do
  @moduledoc """
  Punto de entrada del programa. Junto con `Util`, es el único módulo
  donde puede haber funciones impuras (leer del teclado, imprimir).
  """
  def main do
    recolectores = Datos.recolectores()
    lotes = Datos.lotes()

    recolectores_por_codigo = indexar(recolectores, & &1.codigo)
    lotes_por_id = indexar(lotes, & &1.id)

    pesaje_adicional = pedir_pesaje_adicional(recolectores_por_codigo, lotes_por_id)
    pesajes_totales = Datos.pesajes() ++ List.wrap(pesaje_adicional)

    resultados =
      Enum.map(pesajes_totales, &Validacion.validar_pesaje(&1, recolectores_por_codigo, lotes_por_id))

    pesajes_validos = for {:ok, pesaje} <- resultados, do: pesaje
    rechazados = for {:error, motivo, pesaje} <- resultados, do: {pesaje, motivo}

    liquidaciones = Liquidacion.liquidar_todos(recolectores, pesajes_validos)

    Util.imprimir_mensaje("")
    imprimir_reportes(recolectores, lotes, pesajes_validos, rechazados, liquidaciones, recolectores_por_codigo)
    mostrar_parte_c(liquidaciones, pesajes_validos)
    mostrar_desprendible(recolectores_por_codigo, pesajes_validos, liquidaciones)
  end

  # ---------------------------------------------------------------------
  # Preparación de datos
  # ---------------------------------------------------------------------
  defp indexar(lista, funcion_clave) do
    Map.new(lista, fn elemento -> {funcion_clave.(elemento), elemento} end)
  end

  # ---------------------------------------------------------------------
  # B.5 - Pesaje adicional
  # ---------------------------------------------------------------------
  defp pedir_pesaje_adicional(recolectores_por_codigo, lotes_por_id) do
    linea =
      Util.leer(
        "Ingrese un pesaje adicional (recolector;lote;dia;kilos;verdes) o Enter para omitir: ",
        :string
      )

    case linea do
      "" ->
        Util.imprimir_mensaje("No se agregó ningún pesaje.")
        nil

      _ ->
        procesar_pesaje_adicional(linea, recolectores_por_codigo, lotes_por_id)
    end
  end

  defp procesar_pesaje_adicional(linea, recolectores_por_codigo, lotes_por_id) do
    case Validacion.parsear_linea_pesaje(linea) do
      {:error, :formato_invalido} ->
        Util.imprimir_mensaje("Pesaje rechazado: formato_invalido")
        nil

      {:ok, pesaje} ->
        informar_pesaje_adicional(pesaje, recolectores_por_codigo, lotes_por_id)
        pesaje
    end
  end

  defp informar_pesaje_adicional(pesaje, recolectores_por_codigo, lotes_por_id) do
    case Validacion.validar_pesaje(pesaje, recolectores_por_codigo, lotes_por_id) do
      {:ok, valido} ->
        Util.imprimir_mensaje(
          "Pesaje agregado: #{valido.recolector} en #{valido.lote}, día #{valido.dia}, " <>
            "#{Util.formatear_numero(valido.kilos)} kg, #{Util.formatear_numero(valido.verdes)} % de verdes."
        )

      {:error, motivo, _pesaje} ->
        Util.imprimir_mensaje("Pesaje rechazado: #{motivo}")
    end
  end

  # ---------------------------------------------------------------------
  # Reportes R1 a R8
  # ---------------------------------------------------------------------
  defp imprimir_reportes(recolectores, lotes, pesajes_validos, rechazados, liquidaciones, recolectores_por_codigo) do
    [
      Reportes.reporte_rechazados(rechazados),
      Reportes.reporte_kilos_por_lote(lotes, pesajes_validos),
      Reportes.reporte_kilos_por_dia(pesajes_validos),
      Reportes.reporte_liquidacion(liquidaciones),
      Reportes.reporte_mejor_recolector_dia(pesajes_validos, recolectores_por_codigo),
      Reportes.reporte_mejor_calidad(recolectores, pesajes_validos),
      Reportes.reporte_totales(liquidaciones, pesajes_validos),
      Reportes.reporte_todos_los_lotes(recolectores, lotes, pesajes_validos)
    ]
    |> Enum.each(fn reporte ->
      Util.imprimir_mensaje(reporte)
      Util.imprimir_mensaje("")
    end)
  end

  # ---------------------------------------------------------------------
  # Parte C: keyword lists y combinar con otra finca
  # ---------------------------------------------------------------------
  defp mostrar_parte_c(liquidaciones, pesajes_validos) do
    Util.imprimir_mensaje("C.1. Ranking con opciones")

    Util.imprimir_mensaje("Reportes.ranking(liquidaciones, [])")
    Util.imprimir_mensaje(Reportes.ranking(liquidaciones, []))
    Util.imprimir_mensaje("")

    Util.imprimir_mensaje("Reportes.ranking(liquidaciones, campo: :kilos, limite: 3)")
    Util.imprimir_mensaje(Reportes.ranking(liquidaciones, campo: :kilos, limite: 3))
    Util.imprimir_mensaje("")

    Util.imprimir_mensaje("Reportes.ranking(liquidaciones, orden: :asc, campo: :bruto)")
    Util.imprimir_mensaje(Reportes.ranking(liquidaciones, orden: :asc, campo: :bruto))
    Util.imprimir_mensaje("")

    Util.imprimir_mensaje("C.2. Kilos combinados con la finca vecina")
    kilos_finca = Reportes.kilos_por_dia(pesajes_validos)
    finca_vecina = %{1 => 520.5, 2 => 610, 3 => 480, 5 => 700, 7 => 300}
    combinado = Reportes.combinar_kilos_dia(kilos_finca, finca_vecina)
    Util.imprimir_mensaje(inspect(combinado))
    Util.imprimir_mensaje("")
  end
  # ---------------------------------------------------------------------
  # B.5 - Desprendible de pago
  # ---------------------------------------------------------------------
  defp mostrar_desprendible(recolectores_por_codigo, pesajes_validos, liquidaciones) do
    codigo = Util.leer("Ingrese el código del recolector para ver su desprendible: ", :string)

    case Map.fetch(recolectores_por_codigo, codigo) do
      :error ->
        Util.imprimir_mensaje("No existe un recolector con el código #{codigo}.")

      {:ok, recolector} ->
        pesajes_recolector = Enum.filter(pesajes_validos, &(&1.recolector == codigo))
        liquidacion = Enum.find(liquidaciones, &(&1.codigo == codigo))
        Util.imprimir_mensaje(Reportes.desprendible(recolector, pesajes_recolector, liquidacion))
    end
  end
end
Programa.main()
