defmodule Division do
  def main do
    IO.inspect(dividir(17, 5))   # => {3, 2}
    IO.inspect(dividir(10, 2))   # => {5, 0}
    IO.inspect(dividir(3, 7))    # => {0, 3}
    IO.inspect(dividir(8, 0))    # => {:error, "División por cero"}
  end

  # Función pública: valida el divisor e inicia el cociente en 0
  def dividir(_a, 0), do: {:error, "División por cero"}
  def dividir(a, b) when a >= 0 and b > 0, do: dividir_tail(a, b, 0)

  # Caso base: lo que queda de a es menor que b, ya no se puede restar más
  defp dividir_tail(a, b, cociente) when a < b, do: {cociente, a}

  # Paso recursivo: restamos b y sumamos 1 al cociente
  defp dividir_tail(a, b, cociente), do: dividir_tail(a - b, b, cociente + 1)
end

Division.main()
