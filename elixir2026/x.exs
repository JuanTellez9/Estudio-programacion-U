 # otra manera de hacerlo
    # Enum.reduce(lista,{5,0},fn nota, {min,max} ->
    # {min(nota,min),max(nota,max)}
    # end)
 IO.inspect(
      "la cantidad de estudiantes que ganaron son #{estudiantes} y que perdieron son #{estado}"
    )
 Enum.map(lista,fn estudiantes ->
      estado= if (estudiantes.nota>=3), do: :aprovado, else: :reprobado
        {estudiantes.nombre,estado}
      end)

