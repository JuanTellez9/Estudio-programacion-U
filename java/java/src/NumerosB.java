import javax.swing.JOptionPane;
public class NumerosB {
    public static void main(String[] args) {
        int numero1=ingresarEntero("ingrensar primer numero:");
        int numero2=ingresarEntero("ingrensar el segundo numero:");
        int divisores1=calcularDivisores1(numero1);
        int divisores2=calcularDivisores2( numero2);
        String mensaje=generarMensaje(divisores1,divisores2,numero1,numero2);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int calcularDivisores1(int numero1){
        int suma=0;
        for(int i=1;i<numero1;i++){
            if(numero1%i==0){
                suma+=i;
            }
        }return suma;
    }
    public static int calcularDivisores2(int numero2){
        int suma=0;
        for(int i=1;i<numero2;i++){
            if(numero2%i==0){
                suma+=i;
            }
        }return suma;
    }
    public static String generarMensaje(int divisores1,int divisores2,int numero1,int numero2){
        String mensaje="";
        if(divisores1==numero2&&divisores2==numero1){
            mensaje="son bffis";
        }else{
            mensaje="no son bffis :C";
        }return mensaje;

    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
