 
public class forprofemate {
    public static final int MN=1;
    public static final int MX=20;
    public static void main(String[] args) {
        int numer=ingresarEnteroRango("ingrese un numero:",MN,MX);
        String mensaje=generarMensaje(numer);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int ingresarEnteroRango(String mensaje, int valorMinimo, int valorMaximo) {
        boolean repetir = true;
        double valor = 0;
        while (repetir) {
            valor = ingresarEntero(mensaje);
            if (valor < valorMinimo || valor > valorMaximo) {
            System.out.println("El valor no está entre " + valorMinimo + " y " + valorMaximo);
            } else {
                repetir = false;
            }
        }
    return (int) valor;
    }
    public static String generarMensaje(int numer){
        String mensaje="La tabla de multiplicar del "+numer+ "\n";
        for (int i=1; i<=10; i++){
            mensaje+=numer+" x "+i+" = "+(numer*i)+"\n";
        }
        return mensaje;

    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
      }

}

