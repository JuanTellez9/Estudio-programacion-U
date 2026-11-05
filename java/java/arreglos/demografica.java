import javax.swing.JOptionPane;

public class demografica {
    public static void main(String[] args) {
        int npersonas=ingresarEntero("ingrese el numero total del grupo:");
        String[] genero=ingresarNTextos("ingrese su genero",npersonas);
        int nhombre=calcularNHombre(genero);
        int porcentaje=calcularporcentaje(npersonas,nhombre);
        int porcentajeM=calcularporcentajeM(npersonas,nhombre);
        String mensaje=generarMensaje(porcentaje,porcentajeM);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String ingresarTexto(String mensaje) {
        String texto = JOptionPane.showInputDialog(mensaje);
        return texto;
    }
    public static String[] ingresarNTextos(String mensaje, int cantidad) {
        String[] textos = new String[cantidad];
        for (int i = 0; i < cantidad; i++) {
        textos[i] = ingresarTexto(mensaje + " (" + (i + 1) + " de " + cantidad + "): ");
        }
        return textos;
    }   
    public static int calcularNHombre(String[] genero){
        int contador=0;
        for(int i=0;i<genero.length;i++){
            if(genero[i].toLowerCase().equals("masculino")){
                contador++;
            }
        }return contador;
    }
    public static int calcularporcentaje(int npersonas, int nhombre){
        int porcentaje=0;
        porcentaje=(nhombre*100)/npersonas;
        return porcentaje;
    }
    public static int calcularporcentajeM(int npersonas, int nhombre){
        int porcentaje=0;
        porcentaje=((npersonas-nhombre)*100)/npersonas;
        return porcentaje;
    }
    public static String generarMensaje(int porcentaje, int porcentajeM){
        String mensaje="El porcentaje de hombres es: "+porcentaje+"% \n"+"El porcentaje de mujeres es: "+porcentajeM+"% \n";
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null,mensaje);
    }

    
}