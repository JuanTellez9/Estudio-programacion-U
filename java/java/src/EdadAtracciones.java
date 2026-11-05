import java.util.Scanner;

public class EdadAtracciones {
    public static void main(String[] args) {
        int edad=ingresarEntero("ingresar edad del niño:");
        int edadMinimaA=15;
        int edadMinimaB=16;
        int faltanA=calcularFaltanteA(edad,edadMinimaA);
        int faltanB=calcularFaltanteB(edad,edadMinimaB);
        String mensajeA= generarMensajeFaltanA(faltanA);
        mostrarMensajeA(mensajeA);
        String mensajeB= generarMensajeFaltanB(faltanB);
        mostrarMensajeB(mensajeB);
    }
    public static int ingresarEntero(String mensaje) {
        Scanner scanner = new Scanner(System.in);
        System.out.print(mensaje);
        int valorEntero=scanner.nextInt();
        return valorEntero;
    }
    public static int calcularFaltanteA(int edad,int edadMinimaA){
        int FaltanA=edadMinimaA-edad;
        return FaltanA;
    }
    public static int calcularFaltanteB(int edad,int edadMinimaB){
        int FaltanB=edadMinimaB-edad;
        return FaltanB;
    }
    public static String generarMensajeFaltanA(int faltanA) {
        String mensajeA ="le faltan " + faltanA +" años para ingresar a la actracción de mayores de 15";
        return mensajeA;
    }
    public static String generarMensajeFaltanB(int faltanB) {
        String mensajeA ="le faltan "+ faltanB +" años para ingresar a la actracción de mayores de 16";
        return mensajeA;
    }
    public static void mostrarMensajeA(String mensajeA) {
        System.out.println(mensajeA);
    }
    public static void mostrarMensajeB(String mensajeB) {
        System.out.println(mensajeB);
    }
}