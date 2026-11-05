import java.util.Scanner;

public class piscina {
public static void main(String[] args){
        double ancho=ingresarRealD("ingresar ancho de la piscina:");
        double largo=ingresarRealD("ingresar largo de la piscina:");
        double profundidad=ingresarRealD("ingresar profundidad de la piscina:");
        double menos=0.15;
        double menos15= calcularMenos15(profundidad, menos);
        double volumen= calcularVolumen(ancho,largo, menos15);
        String mensaje= generarMensajeVolumen(volumen);
        mostrarMensaje(mensaje);
}
public static double ingresarRealD(String mensaje){
        Scanner scanner = new Scanner(System.in);
        System.out.print(mensaje);
        double valorReal = scanner.nextDouble();
        return valorReal;
}
public static double calcularMenos15(double profundidad,double menos){
        double menos15=profundidad-menos;
return menos15;
}
public static double calcularVolumen(double ancho,double largo,double profundidad){
        double volumen=ancho*largo*profundidad;
        return volumen;
}
public static String generarMensajeVolumen(double volumen) {
        String mensaje ="se necesitan "+volumen+" metros cúbicos de agua para llenar la piscina hasta 15 cm antes del borde.";
        return mensaje;
}
public static void mostrarMensaje(String mensaje) {
        System.out.println(mensaje);
}
}
