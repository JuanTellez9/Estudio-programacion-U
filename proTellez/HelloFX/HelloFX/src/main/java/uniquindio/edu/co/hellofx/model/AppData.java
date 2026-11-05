package uniquindio.edu.co.hellofx.model;

import java.util.ArrayList;

public class AppData {
    private final ArrayList<Persona> personas = new ArrayList<>();
    private static AppData instancia;

    private AppData() {}

    public static AppData getInstancia() {
        if (instancia == null) {
            instancia = new AppData();
        }
        return instancia;
    }

    public void agregarPersona(Persona persona) {
        personas.add(persona);
    }

    public ArrayList<Persona> getPersonas() {
        return personas;
    }
}