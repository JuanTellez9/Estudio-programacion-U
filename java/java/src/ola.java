import javax.swing.JOptionPane;

public class ola {
    public static void main(String[] args) {
    int numero=ingresarEntero("Ingrese un numero: ");
    int suma=calcularSuma(numero);
    String mensaje=generarMensaje(numero, suma);
    mostrarMensaje(mensaje);   
    }
    public static int ingresarEntero(String mensaje) {
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int calcularSuma(int numero){
        int suma=0;
        for(int i=numero;i!=0;i/=10){         
            suma+=i%10;
        }return suma;
    }
    public static String generarMensaje(int numero, int suma) {
        String mensaje = "La suma de los digitos de " + numero + " es: " + suma;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}