import javax.swing.JOptionPane;
public class multi {
    public static void main(String[] args) {
        int numI=1;
        int numF=15;
        String mensaje=generarmensaje(numI,numF);
        mostrarMensaje(mensaje);

    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarmensaje(int numI,int numF){
        String mensaje="";
        int num=1 ;
        while (numI<=numF) {
            num*=numI;
            numI+=2;
        }
        mensaje="El resultado es:"+num;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}