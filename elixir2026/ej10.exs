defmodule Calculadora do
  @suma 1
  @resta 2
  @multiplicacion 3
  @division 4

  def main do
    operacion = Util.leer("Operación: 1=suma 2=resta 3=multiplicación 4=división: ", :integer)
    num1 = Util.leer("Ingrese el primer número: ", :float)
    num2 = Util.leer("Ingrese el segundo número: ", :float)

    operacion
    |> validar_operacion()
    |> calcular_operacion(num1, num2)
    |> generar_mensaje()
    |> Util.imprimir_mensaje()
  end

  defp validar_operacion(operacion) when operacion in @suma..@division do
    {:ok, operacion}
  end

  defp validar_operacion(_), do: {:error, "No ingresaste una operación correcta."}

  defp calcular_operacion({:error, mensaje}, _num1, _num2), do: {:error, mensaje}

  defp calcular_operacion({:ok, operacion}, num1, num2) do
    case operacion do
      @suma -> {:ok, num1 + num2}
      @resta -> {:ok, num1 - num2}
      @multiplicacion -> {:ok, num1 * num2}
      @division when num2 == 0 -> {:error, "División por cero no permitida."}
      @division -> {:ok, num1 / num2}
    end
  end

  defp generar_mensaje({:ok, resultado}), do: "El resultado es: #{resultado}"
  defp generar_mensaje({:error, mensaje}), do: "Error: #{mensaje}"
end

Calculadora.main()
