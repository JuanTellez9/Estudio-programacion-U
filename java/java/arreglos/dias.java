 import javax.swing.JOptionPane;
 public class dias {
    public static final int DIAS=10;
    public static void main(String[] args) {
        int[] quincuagesimo=ingresarNEnteros("cuantas unidades se producieron el dia ", DIAS);
        int producto=calcularProducto(quincuagesimo);
        String mensaje=generarMensaje(producto);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    
    public static int[] ingresarNEnteros(String mensaje, int cantidad) {
        int[] valores = new int[cantidad];
        for (int i = 0; i < cantidad; i++) {
            valores[i] = ingresarEntero(mensaje + " (" + (i + 1) + " de " + cantidad + "): ");
        }
        return valores;
    }
    public static int calcularProducto(int[] quincuagesimo){
        int contador=0;
        for(int i=0;i<quincuagesimo.length;i++){
            contador+=quincuagesimo[i];
        }
        return contador;
    }
    public static String generarMensaje(int producto){
        String mensaje="el valor final es:"+ producto;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null,mensaje);
    }
    
}

