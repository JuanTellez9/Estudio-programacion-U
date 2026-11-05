import javax.swing.JOptionPane;
public class airLogics {
    public static void main(String[] args) {
        int vuelo=ingresarEnteros("cuantos vuelos se realizaron en el dia: ");
        int[] codigoV=ingresarNEnteros("ingrese el codigo del vuelo ", vuelo);
        String[] destino=ingresarNTextos("ingrese el destino del vuelo", vuelo);
        double[] horaV=ingresarNReales("ingrese la duración del vuelo ", vuelo);
        String[] nacionalOInt=ingresarNTextos("ingrese el tipo de vuelo nacional o internacional del vuelo ", vuelo);
        String ciudadD=ingresarTexto("ingrese la ciudad de destino del vuelo:");
        int nacionales=calcularNacionales(nacionalOInt);
        int internacionales=calcularInternacionales(nacionalOInt);
        int duracion1=calcularDuracion1(horaV);
        int duracion2=calcularDuracion2(horaV);
        int duracion3=calcularDuracion3(horaV);
        int totalH=calcularTotalH(horaV);
        String mensaje=generarMensaje(vuelo,nacionales,internacionales,duracion1,duracion2,duracion3,totalH,ciudadD,destino);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEnteros(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }

    public static double[] ingresarNReales(String mensaje, int cantidad) {
        double[] valores = new double [cantidad];
        for (int i = 0; i < cantidad; i++) {
            valores[i] = Double.parseDouble(JOptionPane.showInputDialog(mensaje + " (" + (i + 1) + " de " + cantidad + "): "));
        }
        return valores;
    }
    public static int[] ingresarNEnteros(String mensaje, int cantidad) {
        int[] valores = new int[cantidad];
        for (int i = 0; i < cantidad; i++) {
            valores[i] = ingresarEnteros(mensaje + " (" + (i + 1) + " de " + cantidad + "): ");
        }
        return valores;
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
    public static int calcularNacionales(String[] nacionalOInt){
        int contador=0;
        for(int i=0;i<nacionalOInt.length;i++){ 
             if(nacionalOInt[i].toLowerCase().equals("nacional")){
                contador++;
            }
        }return contador;
    }
    public static int calcularInternacionales(String[] nacionalOInt){
        int contador=0;
        for(int i=0;i<nacionalOInt.length;i++){
            if(nacionalOInt[i].toLowerCase().equals("internacional")){
                contador++;
            }
        }return contador;
    }
    public static int calcularDuracion1(double[] horaV){
        int contador=0;
        for(int i=0;i<horaV.length;i++){
            if(horaV[i]<2){
                contador++;
            }
        }return contador;
    }
    public static int calcularDuracion2(double[] horaV){
        int contador=0;
        for(int i=0;i<horaV.length;i++){
            if(horaV[i]>=2&&horaV[i]<=5){
                contador++;
            }
        }
        return contador;
    }
    public static int calcularDuracion3(double[] horaV){
        int contador=0;
        for(int i=0;i<horaV.length;i++){
            if(horaV[i]>5){
                contador++;
            }
        }
        return contador;
    } 
    public static int calcularTotalH(double[] horaV){
        int contador=0;
        for(int i=0;i<horaV.length;i++){
            contador+=horaV[i];
        }return contador;        
    }
    public static String generarMensaje(int vuelo,int nacionales,int internacionales,int duracion1,int duracion2,int duracion3,int totalH,String ciudadD, String[] destino){
        String mensaje="El total de vuelos del dia de hoy son: "+vuelo+"\nEl total de vuelos nacionales son: "+nacionales+"\nEl total de vuelos internacionales son: "+internacionales+"\nEl total de vuelos cortos: "+duracion1+"\nEl total de vuelos medios: "+duracion2+"\nEl total de vuelos largos: "+duracion3+"\nEl total de horas de vuelo en el dia es: "+totalH;
        boolean encontrada = false;
        for(int i=0;i<destino.length;i++){
            if(destino[i].equals(ciudadD)){
                encontrada = true;
                break;
            }
        }
        mensaje += "\n¿Existe un vuelo a la ciudad de destino ingresada?: " + (encontrada ? "si" : "no");
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null, mensaje);
    } 
}