import javax.swing.JOptionPane;
public class divisores {
    public static void main(String[] args) {
        int numero=ingresarEnteroMayorQue("Ingrese un numero:",0);
        int divisor=calcularDivisor(numero);
        String mensaje=generarMensaje(numero,divisor);
        mostrarMensaje(mensaje);

    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int ingresarEnteroMayorQue(String mensaje, int valorMinimo) {
        boolean repetir = true;
        double valor = 0;
        while (repetir) {
            valor = ingresarEntero(mensaje);
            if (valor < valorMinimo) {
                System.out.println("El valor no es mayor que " + valorMinimo);
            } else {
                repetir = false;
            }
        }
        return (int) valor;
    }
    public static int calcularDivisor(int numero){
        int suma=0;
        for(int i=1;i<=numero;i++){
            if(numero%i==0){
                suma++;
            }
        }return suma;
    }
    public static String generarMensaje(int numero,int divisor){
        String mensaje="El "+numero+" tiene "+divisor+" divisores.";
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
      }
}
