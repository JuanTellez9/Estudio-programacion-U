import javax.swing.JOptionPane;
public class pasos {
    public static void main(String[] args) {
        int pasosInicio=ingresarEntero("ingresar con cuantas pasos vas iniciar");
        int incremento=ingresarEntero("ingresar la cantidad de pasos por interación");
        int pasos=contarPasos(pasosInicio,incremento);
        String mensaje=generarMensaje(pasos);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int contarPasos(int pasosInicio,int incremento){
        int meta=10000;
        while(pasosInicio<meta){
            pasosInicio+=incremento;
        }
        return pasosInicio;
    }
    public static String generarMensaje(int pasos){
        String mensaje="pasos actuales:"+pasos+"\n...Meta alcanzada";
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }

}
