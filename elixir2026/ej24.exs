defmodule Prueba do
  def main do
    IO.puts(contar(123))    # debe dar 321
    IO.puts(contar(1200))   # debe dar 21
    IO.puts(contar(5))      # debe dar 5
    IO.puts(impares(135))   # debe dar true
    IO.puts(impares(123))   # debe dar false
    IO.puts(impares(7))     # debe dar true
    IO.puts(reversible?(36))

  end

  # acumulador
  def invertir(n), do: invertir(n,0)
  # 1 caso base
  defp invertir(0,acum), do: acum
  # 2
  defp invertir(n,acum), do: invertir(div(n,10),acum*10+rem(n,10))

  def reversible?(n) do
    if rem(n, 10) == 0 do
      false
    else
      impares(n + invertir(n))
    end
  end

  def contar(n), do: contar(n,0)
  defp contar(0,acum), do: acum
  defp contar(n,acum), do: contar(div(n,10),acum+1)

  def impares(0), do: true
  def impares(n) when rem(n,2) == 1, do: impares(div(n,10))
  def impares(_n), do: false

end
Prueba.main()
