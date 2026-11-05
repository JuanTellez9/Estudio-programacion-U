import javax.swing.JOptionPane;
public class totalViaje {
    public static final int TREN=2000;
    public static final int OTROMEDIO=5000;
    public static void main(String[] args) {
        String transporte=ingresarTexto("Por favor, ingrese el transporte: ");
        int kilometros=ingresarEntero("Por favor, ingrese cuantos kilometros han sido recorridos: ");
        int total=calcularTotal(kilometros, transporte);
        String mensaje=generarMensaje(total, transporte);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String ingresarTexto(String mensaje){
        String texto= JOptionPane.showInputDialog(mensaje);
        return texto;
    }
    public static int calcularTotal(int kilometros, String transporte){
        int total;
        if(transporte.equals("tren")){
            total=kilometros*TREN;
        }else{
            total=kilometros*OTROMEDIO;
        }
        
        return total;
    }
    
    public static String generarMensaje(int total, String transporte){
        String mensaje= "Su medio de transporte es: " + transporte + "\n El total de su viaje es: " + total;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
