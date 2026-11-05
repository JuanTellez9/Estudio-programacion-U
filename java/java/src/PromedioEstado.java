import javax.swing.JOptionPane;
public class PromedioEstado {
    public static final double PROMEDIO=3.0;
    public static void main(String[] args) {
        double notaMatematicas=ingresarRealD("Por favor, ingrese su nota de matematicas: ");
        double notaCiencias=ingresarRealD("Por favor, ingrese su nota de ciencias: ");
        double notaLiteratura=ingresarRealD("Por favor, ingrese su nota de literatura: ");
        double promedio=calcularPromedio(notaMatematicas,notaCiencias,notaLiteratura);
        String mensaje=generarMensaje(promedio,notaMatematicas,notaCiencias,notaLiteratura);
        mostrarMensaje(mensaje);
    }
    public static double ingresarRealD(String mensaje){
        return Double.parseDouble(JOptionPane.showInputDialog(mensaje));
    }
    public static double calcularPromedio(double notaMatematicas,double notaCiencias,double notaLiteratura){
        double promedio=(notaMatematicas + notaCiencias + notaLiteratura)/3;
        return promedio;
    }
    public static String generarMensaje(double promedio,  double notaMatematicas, double notaCiencias, double notaLiteratura){
    String mensaje;
    if(promedio>=PROMEDIO){
        mensaje="La nota de matematica: " + notaMatematicas + "\nLa nota de ciencias es:  " + notaCiencias +"\n La nota de literatura es: " + notaLiteratura + "\n El promedio total es: " + promedio + "\n promovido ";
    }else{
        mensaje= "La nota de matematica: " + notaMatematicas + "\nLa nota de ciencias es:  " + notaCiencias +"\n La nota de literatura es: " + notaLiteratura + "\n El promedio total es: " + promedio + "\n Rechazado, intentalo de nuevo";
    }
    return mensaje;
    }
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null,mensaje);
    }
}