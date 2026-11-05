package model;

import java.util.ArrayList;
import java.util.List;

public class Estudiante {
    private String nombre;
    private List<Double> notas= new ArrayList<>();

    public Estudiante (String nombre,List<Double> notas){
        this.nombre=nombre;
        this.notas = notas;
    }

   public double promedio() {
    double suma = 0;
    for (Double n : notas) {
        suma += n;
    }
    double prom=suma/notas.size();
    return prom;
}
}
