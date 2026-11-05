import javax.swing.JOptionPane;
public class primos {
    public static void main(String[] args) {
        int numero=ingresarEnteros("ingrese un numero: ");
        String mensaje=generarMensaje(numero);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEnteros(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int numero){
        String mensaje="";
        int contador =0;
        for(int i=1;i<=numero;i++){
            if(numero%i==0){
                contador++;
            }
        }
        if(contador==2){
            mensaje="el numero es primo";
        }else{
            mensaje="el numero no es primo";
        }
        return mensaje;
    }     
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null, mensaje);
    }       
}

