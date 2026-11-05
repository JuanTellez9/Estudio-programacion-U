defmodule Prueba do
  def main do
    IO.puts(contar_mayores([1,5,3,8,2],3))
    IO.puts(contar_mayores([],3))

  end
  #acumulador
  def contar_mayores(lista,limite), do: contar(lista,limite,0)
  # 1 caso base
  defp contar([],_limite,acum), do: acum
  # 2 head mayor
  defp contar([head|tail],limite,acum) when head > limite do
    contar(tail,limite,1+acum)
  end
  # 3 head menor
  defp contar([_head|tail],limite,acum), do: contar(tail,limite,acum)
end
Prueba.main()
