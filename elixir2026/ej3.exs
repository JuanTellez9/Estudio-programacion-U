defmodule Red do
  def main do

   leer_datos("Digite su nombre de usuario:")
    |>calcular()
    |>generar_mensaje()
    |>imprimir_mensaje()
  end
  def generar_mensaje(nombre) do
    if nombre>=5 do
      "Nombre de usuario valido."
    else
        "Nombre de usuario muy corto, debe tener al menos 5 caracteres"
    end
  end
  def calcular(nombreUsuario) do
    String.length(nombreUsuario)
  end

  def imprimir_mensaje(mensaje) do
    IO.puts(mensaje)
  end
  def leer_datos (mensaje) do
    IO.gets(mensaje)
    |>String.trim()
  end
end
Red.main()
