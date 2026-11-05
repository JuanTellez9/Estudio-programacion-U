import javax.swing.JOptionPane;
public class boxeo {
    public static void main(String[] args) {
        int peso=ingresarEntero("Por favor, ingresar el peso:");
        String mensaje=generarMensaje(peso);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int peso){
        String mensaje;
        if(peso<=47){
            mensaje="Tu categoria es Minima :)";
    }else if(peso>=48 && peso<=52){
        mensaje="Tu categoria es Mosca :)";
        }else if (peso>=53 && peso<=55){
            mensaje="Tu categoria es Gallo :)";
        }else if(peso>=56 && peso<=64){
            mensaje="Tu categeria Pluma";
        }else if(peso>=65 && peso<=77){
            mensaje="Tu categoria es Mediano";
        }else if (peso>=78 && peso<=90){
            mensaje="Tu categoria es Crucero";
        }else{
            mensaje="Tu categoria es Pesado :)";

        }
        return mensaje;
}
public static void mostrarMensaje(String mensaje) {
    JOptionPane.showMessageDialog(null, mensaje);
}

}
