import java.util.Scanner;

public class descuentoq {
public static void main(String[] args) {
    double valorDelproducto=ingresarRealD("Ingresar el valor del producto:");
    double descuento=ingresarRealD("Ingresar el valor del descuento:");
    double valorD=calcularValorD(valorDelproducto,descuento);
    double valorF=calcularValorF(valorD,valorDelproducto);
    String mensaje=generarMensajeValorF(valorF);
    mostrarMensaje(mensaje);
}
public static double ingresarRealD(String mensaje){
    Scanner scanner = new Scanner(System.in);
    System.out.print(mensaje);
    double valorReal = scanner.nextDouble();
    return valorReal;
}
public static double calcularValorD(double descuento,double valorDelproducto){
    double valorD=descuento*valorDelproducto;
    return valorD;
}
public static double calcularValorF(double valorDescuento,double valorDelproducto){
    double valorF=valorDelproducto-valorDescuento;
    return valorF;
}
public static String generarMensajeValorF(double valorF){
    String mensaje="El valor del producto con el descuento es: "+valorF;
    return mensaje;
}
public static void mostrarMensaje(String mensaje) {
    System.out.println(mensaje);
}
}

