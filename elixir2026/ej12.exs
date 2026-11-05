defmodule Estudiantes do
  def main do
    # Se define una lista con las notas de los estudiantes (para probar las funciones)
    lista = [
      %{nombre: "pepe", nota: 3},
      %{nombre: "maria", nota: 4},
      %{nombre: "juan", nota: 4.6},
      %{nombre: "luisa", nota: 1.6},
      %{nombre: "carlos", nota: 2.3},
      %{nombre: "ana", nota: 4.5},
      %{nombre: "marcos", nota: 1}
    ]

    promedio = obtener_promedio(lista)
    IO.puts("El promedio de notas es: #{promedio} ")

    {mayores, menores} = contar_estudiantes(lista, promedio)

    IO.puts(
      "\nla cantidad de estudiantes por encima del promedio son #{mayores} y por debajo son #{menores}"
    )

    {minimo, maximo} = obtener_notas(lista)
    IO.puts("\nla nota mas baja es #{minimo} y la mas alta es #{maximo}")

    {ganaron, perdieron} = contar_estudiantes_estado(lista)

    IO.puts(
      "\nla cantidad de estudiantes que ganaron son #{ganaron} y que perdieron son #{perdieron}"
    )

    estado = agregar_estado(lista)
    IO.puts(estado)

    lista_ordenada = ordenar(lista)
    IO.inspect(lista_ordenada, label: "Lista ordenada: ")

    aprobados = obtener_aprobados(lista)
    IO.inspect(aprobados, label: "Lista de aprobados: ")
  end

  # si la lista es vacia retorna error
  def obtener_promedio([]), do: 0
  # si no es vacia
  def obtener_promedio(lista) do
    # suma= Enum.sum(lista) otra forma de hacer pero con enum reduce|>
    suma = Enum.reduce(lista, 0, fn estudiante, suma -> suma + estudiante.nota end)
    suma / length(lista)
    # otra forma mapeada
    # suma =
    # Enum.map(lista, fn estudiante -> estudiante.nota end)
    # |> Enum.reduce(0, fn nota, suma -> suma + nota end)
  end

  def contar_estudiantes(lista, promedio) do
    # queda una lista por encima del promedio
    # mayores = Enum.count(lista, fn nota->nota>promedio end)
    # Enum.count() tamaño de la lista funciona tambien como Enum.filter()
    # fn nota->nota>promedio end == &(&1 > promedio)
    # menores=length(lista) - mayores
    # {mayores,menores}
    # Otra forma con reduce

    Enum.reduce(lista, {0, 0}, fn estudiante, {mayores, menores} ->
      # en fn estudiante tambien puede ser %{nombre: _nombre,nota: nota}
      if estudiante.nota > promedio do
        {mayores + 1, menores}
      else
        {mayores, menores + 1}
      end
    end)
  end

  def obtener_notas(lista) do
    # Enum.min_max(lista.nota)
    # otra manera de hacerlo
    Enum.reduce(lista, {5, 0}, fn estudiante, {min, max} ->
      {min(estudiante.nota, min), max(estudiante.nota, max)}
    end)
  end

  def contar_estudiantes_estado(lista) do
    ganaron = Enum.count(lista, fn nota -> nota >= 3 end)
    perdieron = length(lista) - ganaron
    {ganaron, perdieron}
  end

  def agregar_estado(lista) do
    Enum.map(lista, fn estudiantes ->
      estado = if estudiantes.nota >= 3, do: :aprovado, else: :reprobado
      "El estudiante #{estudiantes.nombre} fue #{estado}"
    end)
    |> Enum.join(". \n")
  end

  def ordenar(lista) do
    Enum.sort_by(lista, fn estudiantes -> estudiantes.nota end, :desc)
  end
  def obtener_aprobados(lista) do
    Enum.filter(lista,fn estudiantes -> estudiantes.nota >= 3  end)
    |>Enum.map(fn estudiantes -> estudiantes.nombre end)
  end
end

Estudiantes.main()
