defmodule Parametros do
  @moduledoc """
  Parámetros de negocio de la finca cafetera.

  Se definen como atributos de módulo (constantes que se resuelven al
  compilar) y se exponen mediante funciones para que los demás módulos
  no tengan que repetir los mismos valores.
  """

  @tarifa_base_por_kilo 1000
  @meta_diaria_kilos 400
  @dia_minimo 1
  @dia_maximo 6
  @max_kilos_pesaje 250
  @kilos_para_bonificacion 120
  @bonificacion_diaria 8000
  @descuento_alimentacion_diario 12_000

  def tarifa_base_por_kilo, do: @tarifa_base_por_kilo
  def meta_diaria_kilos, do: @meta_diaria_kilos
  def dia_minimo, do: @dia_minimo
  def dia_maximo, do: @dia_maximo
  def rango_dias, do: @dia_minimo..@dia_maximo
  def max_kilos_pesaje, do: @max_kilos_pesaje
  def kilos_para_bonificacion, do: @kilos_para_bonificacion
  def bonificacion_diaria, do: @bonificacion_diaria
  def descuento_alimentacion_diario, do: @descuento_alimentacion_diario
end
