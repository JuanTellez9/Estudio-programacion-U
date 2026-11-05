import javax.swing.JOptionPane;
public class contador {
    public static void main(String[] args) {
        int valorInicial=ingresarEntero("ingrese el valor inicial de la cuenta regresiva:");
        int valorFinal=ingresarEntero("ingresar el valor final de la cuenta regresiva:");
        String mensaje=generarMensajeCohete(valorInicial,valorFinal);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensajeCohete(int valorInicial,int valorFinal){
        String mensaje="";
        while(valorInicial>=valorFinal){
            mensaje+=valorInicial+"\n";
            valorInicial--;
        }
        mensaje +="¡Despegue!";
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
