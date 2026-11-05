package uniquindio.edu.co.hellofx.model;


public class Persona {
    private String nombre;
    private String imagenUrl;

    public Persona(String nombre, String imagenUrl) {
        this.nombre = nombre;
        this.imagenUrl = imagenUrl;
    }

    public String getNombre() {
        return nombre;
    }

    public String getImagenUrl() {
        return imagenUrl;
    }
}