defmodule Tem do
    def main do
      leer_datos("Digite la temperatura en celsius:")
      |>convertir_temperatura()
      |>generar_mensaje()
      |>imprimir_mensaje()
    end
   def convertir_temperatura(celsius) do
    celsius * 9 / 5 + 32
  end
    def generar_mensaje(celsius) do
      "La temperatura en Fahrenheit es: #{celsius}"
    end

    def imprimir_mensaje(mensaje) do
      IO.puts(mensaje)
    end
    def leer_datos (mensaje) do
      IO.gets(mensaje)
      |>String.trim()
      |>String.to_integer()
    end


end

Tem.main()
