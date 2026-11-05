defmodule Matematicas do
  def main do
    IO.puts(factorial(5))     # => 120
    IO.inspect(factorial(-3)) # => {:error, "El factorial no está definido para números negativos"}
  end

  # Caso base: el factorial de 0 es 1
  def factorial(0), do: 1

  # Caso recursivo: n! = n × (n-1)!
  def factorial(n) when n > 0, do: n * factorial(n - 1)

  # Manejo de errores
  def factorial(n) when n < 0 do
    {:error, "El factorial no está definido para números negativos"}
  end
end

Matematicas.main()
