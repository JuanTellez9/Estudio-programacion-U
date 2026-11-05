defmodule RecursivoLista do
  def main do
    IO.puts(sumar([1, 2, 3, 4, 5]))
    IO.puts(mayor([3, 4, 6, 8]))
  end

  def sumar([]), do: 0

  def sumar([head | tail]) when head > 3 do
    head + sumar(tail)
  end

  def sumar([_head | tail]), do: sumar(tail)

 def mayor([head | tail]), do: mayor(tail, head)

  def mayor([], max), do: max

  def mayor([head | tail], max) when head > max do
    mayor(tail, head)
  end

  def mayor([_head | tail], max), do: mayor(tail, max)
end


RecursivoLista.main()
