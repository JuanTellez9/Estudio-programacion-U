import javax.swing.JOptionPane;
public class lacteos {
    public static final int SALARIOMAXI=1500000;
    public static final double BONIFICACION=0.10;
    public static void main(String[] args) {
        int salario=ingresarEntero("Ingresar salario:");
        double bonificacion=calcularBonificacio(salario,BONIFICACION);
        double sumaTotal=calcularSumaTotal(salario,bonificacion);
        String mensaje=generarMensaje(salario,sumaTotal,SALARIOMAXI);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static double calcularBonificacio(int salario,double BONIFICACION){
        double bonificacion=salario*BONIFICACION;
        return bonificacion;
    }
    public static double calcularSumaTotal(int salario,double bonificacion){
        double sumaTotal=salario+bonificacion;
        return sumaTotal;
    }
    public static String generarMensaje(int salario,double sumaTotal,int SALARIOMAXI){
        String mensaje;
        if(salario<SALARIOMAXI){
            mensaje="Su saalario con bonificación es: "+sumaTotal;
        }else{
            mensaje="No eres apto para la bonificación"+"\nSu salario es:"+salario;
        }
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}

