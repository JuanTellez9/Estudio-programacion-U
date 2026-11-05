defmodule Tambola do
  @minimo 1
  @maximo 3

  def main do
    numero = Util.leer("ingrese una numero: ", :integer)

    participar(numero)
    |> Util.imprimir_mensaje()
  end

  defp participar(numero) when numero in @minimo..@maximo do
    numero
    |>calcular_diferencia()
    |>evaluar_resultado()
  end

  defp participar(_), do: "Numero no valido; el recibo no participa en la támbola."

  def calcular_diferencia (numero_cliente) do
    numero_ganador=:rand.uniform(@maximo)
    abs(numero_cliente- numero_ganador)
  end
  def evaluar_resultado(0), do: "¡Felicidades, su mercado es gratis!"
  def evaluar_resultado(1), do: "Ufff casi pelado por uno"
  def evaluar_resultado(diferencia), do: "Lo siento, no ganó. La diferencia fue de #{diferencia}."
end

Tambola.main()
