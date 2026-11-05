import javax.swing.JOptionPane;
public class calculadora {
    public static void main(String[] args) {
        int valor=ingresarEntero("A continuacion se presentaran las obciones posibles para realizar operaciones,\npor favor selecciona un número de la operación que desees.\n1:suma\n2:Resta\n3:Multiplicaón\n4:División");
        int numero1=ingresarEntero("por favor, ingrese el primer numero para calcular:");
        int numero2=ingresarEntero("por favor, ingrese el segundo numero para calcular:");
        int resultado=0;
        String mensaje=generarMensaje(valor,numero1,numero2);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String generarMensaje(int valor,int numero1,int numero2){
        int resultado;
        String mensaje;
    switch(valor){
        case 1:
        resultado= numero1 + numero2;
        mensaje="La suma es:"+resultado;
        break;
        case 2:
        resultado=numero1-numero2;
        mensaje="La resta es:"+resultado;
        break;
        case 3:
        resultado=numero1*numero2;
        mensaje="La multiplicación es:"+resultado;
        break;
        case 4:
        resultado=numero1/numero2;
        mensaje="La division es:"+resultado;
        break;
        default:
        mensaje="La opcion seleccionada NO es correcta";
    }
    return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}

