import javax.swing.JOptionPane;
public class pablo {
 public static void main(String[] args) {
    int numero1= ingresarEnteroMayorQue("Ingrese el primer número:", 0);
    int numero2= ingresarEnteroMayorQue("Ingrese el segundo número:", 0);
    int mcd = calcularMCD(numero1, numero2);
    String mensaje=generarMensaje(numero1, numero2, mcd);
    mostrarMensaje(mensaje);
 }
   public static int ingresarEnteroMayorQue(String mensaje, int valorMinimo) {
       int valor;
      do {
           valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
          if (valor < valorMinimo) {
              JOptionPane.showMessageDialog(null, "El número debe ser mayor que " + valorMinimo);
         }
      } while (valor < valorMinimo);
    return valor;
 }
   public static int calcularMCD(int numero1,int numero2){
      int mcd=1;
         for(int i=1;i<=numero1&&i<=numero2;i++){
            if(numero1%i==0&&numero2%i==0)
               mcd=i;
         }return mcd;
   }
   public static String generarMensaje(int numero1,int numero2, int mcd){
      String mensaje="El MCD de "+numero1+" y "+numero2+" es: "+mcd;
      return mensaje;
   }
   public static void mostrarMensaje(String mensaje) {
      JOptionPane.showMessageDialog(null, mensaje);
  }
}