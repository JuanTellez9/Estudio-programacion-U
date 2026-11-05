defmodule Prueba  do
def main do
  IO.puts(contar_mayores([1,5,3,8,2],3))
  IO.puts(contar_mayores([],3))
end
# 1. caso base
def contar_mayores([],_limite), do: 0
# 2 si el head es mayor al limite
def contar_mayores([head|tail],limite) when head > limite do
  1 + contar_mayores(tail,limite)
end
# 3 si no es mayor
def contar_mayores([_head|tail],limite), do: contar_mayores(tail,limite)

end
Prueba.main()
