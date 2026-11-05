defmodule Prueba do
  def main do
    IO.puts(sumar_digitos(1234))   # debe dar 10
    IO.puts(sumar_digitos(7))      # debe dar 7
    IO.puts(sumar_digitos(0))      # debe dar 0
  end
  #1 caso base
  def sumar_digitos(0), do: 0
  #2 suma
  def sumar_digitos(n) when n > 0, do: rem(n,10) + sumar_digitos(div(n,10))

end
Prueba.main()
