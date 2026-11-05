import javax.swing.JOptionPane;
public class factorial {
    public static void main(String[] args) {
        int numero=ingresarEnteros("ingrese un numero: ");
        String mensaje=generarMensaje(numero);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEnteros(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int numero){
        String mensaje="";
        int factorial=1;
        for(int i=1;i<=numero;i++){
            factorial=factorial*i;
        }
        mensaje="el factorial es: "+factorial;
        return mensaje;
    }     
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
