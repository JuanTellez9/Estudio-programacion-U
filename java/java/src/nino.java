import javax.swing.JOptionPane;

public class nino {
    public static void main(String[] args){
        int nino1=ingresarEntero("Por favor, ingrese la edad del niño 1:");
        int nino2=ingresarEntero("Por favor, ingrese la edad del niño 2:");
        int nino3=ingresarEntero("Por favor, ingrese la edad del niño 3:");
        int nino4=ingresarEntero("Por favor, ingrese la edad del niño 4:");
        String mensaje=generarMensaje(nino1,nino2,nino3,nino4);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int nino1,int nino2,int nino3,int nino4){
        String mensaje;
        if(nino1>nino2){
            if(nino1>nino3){
                if(nino1>nino4){
                    mensaje="El nino 1 es mayor";
                }else{
                    mensaje="El niño 4 es mayor";
                }
            }else if(nino3>nino4){
                mensaje="El niño 3 es el mayor";
            }else{
                mensaje="El niño 4 es mayor";
            }
        }else if(nino2>nino3){
            if(nino2>nino4){
                mensaje="El nino 2 es mayor";
            }else{
                mensaje="El niño 4 es mayor";
            }
        }else if(nino3>nino4){
            mensaje="El nino 3 es el mayor";
        }else{
            mensaje="El nino 4 es el mayor";
        }
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}