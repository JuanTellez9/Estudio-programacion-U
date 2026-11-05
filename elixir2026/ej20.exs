defmodule Prueba do
  def main do
    IO.puts(largo([5,8,2,9]))
    IO.puts(largo([]))
  end
  # 1. caso base
  def largo([]), do: 0
  def largo([_head|tail]), do: 1 + largo(tail)
end
Prueba.main()
