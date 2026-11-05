public class nfac {
    public static void main(String[] args) {
        int numer=ingresarEnteroMayorque("ingrese un numero:",0);
        int cal=calcularEntero(numer);
        String mensaje=generarMensaje(cal,numer);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int ingresarEnteroMayorque(String mensaje, int valorMinimo) {
        boolean repetir = true;
        double valor = 0;
        while (repetir) {
            valor = ingresarEntero(mensaje);
            if (valor < valorMinimo) {
                System.out.println("El valor no es mayor que " + valorMinimo);
            } else {
                repetir = false;
            }
        }
        return (int) valor;
    }
    public static int calcularEntero(int numer){
        int factorial=1;
        for(int i=1;i<=numer;i++){
           factorial*=i;
        }return factorial;
    }
    public static String generarMensaje(int cal,int numer){
        String mensaje="El factorial de "+numer+" es:"+ cal;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        javax.swing.JOptionPane.showMessageDialog(null, mensaje);
      }
}
