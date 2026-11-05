import javax.swing.JOptionPane;

public class PrimosSimple {
    public static void main(String[] args) {
            int numero = ingresarEnteroMayorQue("Ingrese un número límite:", 0);
            String mensaje = generarMensaje(numero);
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
    
        public static String generarMensaje(int numero) {
          String mensaje = "Los numeros primos hasta el "+numero+" son:\n"; 
    
            for (int i = 2; i <= numero; i++) { 
                int contador = 0;
    
                for (int j = 1; j <= i; j++) { 
                    if (i % j == 0) { 
                        contador++; 
                    }
                }
    
                if (contador == 2) { 
                    mensaje += i + " "; 
                }
            }
    
            return mensaje;
        }
    
        public static void mostrarMensaje(String mensaje) {
            JOptionPane.showMessageDialog(null, mensaje);
        }
    }
    
