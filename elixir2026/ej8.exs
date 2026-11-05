defmodule Clima do
  def main do
    temperatura = Util.leer("Ingrese la temperatura actual (°C): ", :integer)
    humedad = Util.leer("Ingrese la humedad relativa(%): ", :integer)

    desicion(temperatura, humedad)
    |> generar_mensaje()
    |> Util.imprimir_mensaje()
  end

  def desicion(temperatura, humedad) do
    cond do
      humedad > 100 || humedad <= 0 ->
        "valores invalidos"

      temperatura >= 30 && humedad > 70 ->
        "Clima muy caluroso y húmedo, cuidado con golpes de calor"

      temperatura >= 30 && humedad <= 40 ->
        "Clima seco y caliente, mantente hidratado"

      temperatura >= 15 && temperatura <= 29 ->
        "Clima agradable"

      temperatura < 15 ->
        "Hace frío, abrígate"
    end
  end

  def generar_mensaje(desicion) do
    "#{desicion}"
  end
end

Clima.main()
