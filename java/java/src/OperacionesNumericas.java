import javax.swing.JOptionPane;

public class OperacionesNumericas {
    public static void main(String[] args) {
        double numero1 = ingresarRealD("Ingresar primer número:");
        double numero2 = ingresarRealD("Ingresar segundo número:");

        double suma = calcularSuma(numero1, numero2);
        double diferencia = calcularDiferencia(numero1, numero2);
        double producto = calcularProducto(numero1, numero2);
        double division = calcularDivision(numero1, numero2);

        String mensaje = generarMensaje(numero1,numero2,suma,diferencia,producto,division);
        mostrarMensaje(mensaje);
    }

    public static double ingresarRealD(String mensaje) {
        return Double.parseDouble(JOptionPane.showInputDialog(mensaje));
    }

    public static double calcularSuma(double numero1,double numero2){
        double suma=numero1+numero2;
        return suma;
    }
    public static double calcularDiferencia(double numero1,double numero2){
        double diferencia=numero1-numero2;
        return diferencia;
    }
    public static double calcularProducto(double numero1,double numero2){
        double producto=numero1*numero2;
        return producto;
    }
    public static double calcularDivision(double numero1,double numero2){
        double division=numero1/numero2;
        return division;
    }
    public static String generarMensaje(double numero1,double numero2,double suma,double diferencia,double producto,double division){
        String mensaje;
        if(numero1>=numero2){
            mensaje="Suma:"+suma+"\nDiferencia:"+diferencia;
        }else{
            mensaje="Producto:"+producto+"\nDivision:"+division;
        }
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
