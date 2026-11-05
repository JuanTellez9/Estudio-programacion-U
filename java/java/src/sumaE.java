import javax.swing.JOptionPane;
public class sumaE{
    public static void main(String[] args) {
        int numI=1;
        int numF=20;
        String mensaje=generarMensaje(numI,numF);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int numI,int numF){
        String mensaje="";
        int num=0;
        while(numI<=numF){
            num+=numI;
            numI++;
        }
        mensaje="El resultado es:" +num;
        return mensaje;

    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
      }
}