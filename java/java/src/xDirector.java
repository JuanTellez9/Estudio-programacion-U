import javax.swing.JOptionPane;
public class xDirector {
    public static void main(String[] args) {
        int Vinicial=ingresarEnteroMayorque("ingrese el valor inical:",0);
        int Vfinal=ingresarEnteroMayorque("ingrese el valor final:",Vinicial);
        String mensaje=generarMensaje(Vinicial,Vfinal);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int ingresarEnteroMayorque(String mensaje, int valorMinimo) {
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
    public static String generarMensaje(int Vinicial, int Vfinal){
        String mensaje="";
        for (int i=Vinicial; i<=Vfinal;i++){
            mensaje+=i+"._____________________\n";
        }
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
      }
    
}
