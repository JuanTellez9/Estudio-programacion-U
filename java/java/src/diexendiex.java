import javax.swing.JOptionPane;
public class diexendiex {
  public static void main(String[] args) {
    int numI=10;
    int numF=100;
    String mensaje=generarMensaje(numI,numF);
    mostrarMensaje(mensaje);
  } 
  public static int ingresarEntero(String mensaje) {
    int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
    return valor;
}
  public static String generarMensaje(int numI,int numF){
    String mensaje="";
    while(numI<=100){
            mensaje+=numI+"\n";
            numI+=10;
        }return mensaje;
  }
  public static void mostrarMensaje(String mensaje) {
    JOptionPane.showMessageDialog(null, mensaje);
  }
  }
  
