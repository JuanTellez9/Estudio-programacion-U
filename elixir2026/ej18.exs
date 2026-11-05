defmodule Matematicas do
  def main do
    # => 120
    IO.puts(factorial(5))
    # => 5
    IO.puts(fibonacci(5))
    # => [3, 2, 1]
    IO.inspect(invertir([1, 2, 3]))
    # => 6
    IO.puts(sumar([1, 2, 3]))
    #
    IO.inspect(filtrar([3, 4, 5, 2], 3))
  end

  def factorial(n), do: factorial_tail(n, 1)
  defp factorial_tail(0, acum), do: acum

  defp factorial_tail(n, acum) when n > 0 do
    factorial_tail(n - 1, n * acum)
  end

  # ------------------------------------------------------------------
  def fibonacci(n), do: fibonacci_tail(n, 0, 1)
  defp fibonacci_tail(0, a, _b), do: a

  defp fibonacci_tail(n, a, b) when n > 0 do
    fibonacci_tail(n - 1, b, a + b)
  end

  # ------------------------------------------------------------------
  def invertir(lista), do: invertir(lista, [])
  defp invertir([], acum), do: acum
  defp invertir([head | tail], acum), do: invertir(tail, [head | acum])
  # ------------------------------------------------------------------
  def sumar(lista), do: sumar(lista, 0)
  defp sumar([], acumulado), do: acumulado
  defp sumar([head | tail], acumulado), do: sumar(tail, head + acumulado)
  # --------------------------------------------------------------------
  def filtrar(lista, x), do: filtrar_tail(lista, x, [])
  defp filtrar_tail([], _x, lista_nueva), do: invertir(lista_nueva)

  defp filtrar_tail([head | tail], x, lista_nueva) when head > x,
    do: filtrar_tail(tail, x, [head | lista_nueva])

  defp filtrar_tail([_head | tail], x, lista_nueva),
    do: filtrar_tail(tail, x, lista_nueva)
end

Matematicas.main()
