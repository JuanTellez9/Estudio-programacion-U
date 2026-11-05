import java.util.Scanner;
public class devuelta {
    public static void main(String[] args) {
        int valorTotalF = ingresarEntero("Ingresar valor total de la compra:");
        int dineroPago = ingresarEntero("Ingresar dinero recibido:");
        int devuelta = calcularDevuelta(valorTotalF,dineroPago);
        String mensaje = generarMensajeDevuelta(devuelta);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        Scanner scanner = new Scanner(System.in);
        System.out.print(mensaje);
        int valorEntero=scanner.nextInt();
        return valorEntero;
        }
    public static int calcularDevuelta(int valorTotalF,int dineroPago){
        int devuelta=dineroPago-valorTotalF;
        return devuelta;
    }
    public static String generarMensajeDevuelta(int devuelta) {
        String mensaje = "El valor de la devuelta es:$" + devuelta;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        System.out.println(mensaje);
    }
}
