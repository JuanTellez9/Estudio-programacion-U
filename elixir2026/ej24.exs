defmodule Prueba do
  def main do
    IO.puts(invertir(123))    # debe dar 321
    IO.puts(invertir(1200))   # debe dar 21
    IO.puts(invertir(5))      # debe dar 5
  end

  # acumulador
  def invertir(n), do: invertir(n,0)
  # 1 caso base
  defp invertir(0,acum), do: acum
  # 2
  defp invertir(n,acum), do: invertir(div(n,10),acum*10+rem(n,10))


end
Prueba.main()
