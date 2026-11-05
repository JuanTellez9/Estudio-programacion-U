public class idserie {
    public static void main(String[] args) {
        int codigo = ingresarEntero("Ingrese el numero de serie : ");
        String mensaje = generarMensaje(codigo);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor = Integer.parseInt(javax.swing.JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int codigo) {
        String mensaje = "";
        int suma=0;
        for (int i =codigo; i !=0; i/=10) {
            int digito = i % 10;
            if (digito % 2 == 0) {
                suma++;
            }
        }
        mensaje = "El numero de serie " + codigo + " tiene " + suma + " pares.";
        return mensaje;
    }   
    public static void mostrarMensaje(String mensaje) {
        javax.swing.JOptionPane.showMessageDialog(null, mensaje);
    }
}
