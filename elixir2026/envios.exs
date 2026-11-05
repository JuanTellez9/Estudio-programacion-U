defmodule Envios do
  def main do
    nombre = leer_datos("Por favor, ingrese su nombre: ")
    destinario = leer_datos("Por favor, ingrese el destinario: ")
    direccion = leer_datos("Por favor, ingresa la dirreccion de entrega: ")

    generar_mensaje(nombre, destinario, direccion)
    |> imprimir_mensaje()
  end

  def generar_mensaje(nombre, destinatario, direccion) do
    "El paquete a nombre de #{nombre} quedó registrado para ser entregado a #{destinatario} en la dirección #{direccion}"
  end

  def imprimir_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def leer_datos(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
    |> String.downcase()
  end
end

Envios.main()
