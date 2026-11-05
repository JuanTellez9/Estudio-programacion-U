defmodule Plan do
  def main do
    plan1 = Util.leer("Ingrese el valor del plan 1:", :float)
    vGiga1 = Util.leer("Ingrese el valor por giga del plan 1:", :float)
    plan2 = Util.leer("Ingrese el valor del plan 2:", :float)
    vGiga2 = Util.leer("Ingrese el valor por giga del plan 2:", :float)
    consumo = Util.leer("Ingrese las gigas de consumo de mas:", :integer)

    costo1=calcularCostoPlan1(plan1, vGiga1, consumo)
    costo2=calcularCostoPlan2(plan2, vGiga2, consumo)
    ahorro=calcularAhorro(costo1,costo2)


    decision(costo1,costo2)
    |>generar_mensaje(ahorro)
    |>Util.imprimir_mensaje()

  end

  def calcularCostoPlan1(plan1, vGiga1, consumo), do: plan1 + vGiga1 * consumo
  def calcularCostoPlan2(plan2, vGiga2, consumo), do: plan2 + vGiga2 * consumo

  def decision(costo1,costo2) do

    cond do
      costo1 < costo2 -> :plan_1
     costo1 > costo2 -> :plan_2
      costo1==costo2 -> :empate

    end
  end

  defp formatear_ahorro(ahorro), do: :erlang.float_to_binary(ahorro, decimals: 2)

  def calcularAhorro(costo1,costo2) do
    cond do
    costo1 < costo2 -> costo2-costo1
    costo1 > costo2 -> costo1-costo2
    costo1==costo2 -> costo1
    end
  end
  def generar_mensaje(decision,ahorro) do

    ahorro_formateado = formatear_ahorro(ahorro)

  cond do
    decision == :plan_1  ->"Le conviene el plan 1, ahorra $#{ ahorro_formateado}al mes"
    decision == :plan_2 ->"Le conviene el plan 2, ahorra $#{ ahorro_formateado} al mes"
    decision == :empate ->"Los dos planes cuestan lo mismo, $#{ ahorro_formateado} al mes"

    end

  end

end

Plan.main()
