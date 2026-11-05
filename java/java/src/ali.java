import javax.swing.JOptionPane;

public class ali {
    public static void main(String[] args) {
        int numero=ingresarEntero("ingrese un numero limite:");
        String mensaje=generarMensaje(numero);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int numero){
        String mensaje="";
        int suma=0;
        for(int i=1;i<=numero;i++){
            if(i%2!=0){
                suma+=i;
            }
        } mensaje="la suma de los impares es de :"+suma;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
