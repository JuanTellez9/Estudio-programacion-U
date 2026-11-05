defmodule Potencia do
  def main do
    IO.inspect(potencia(2, 6))
  end

  def potencia(_base, exponente) when exponente < 0,
    do: {:error, "El exponente no puede ser negativo"}

  # siempre delcarar el caso base
  def potencia(_base, 0), do: 1

  def potencia(base, exponente) do
    base * potencia(base, exponente - 1)
  end
end

Potencia.main()
