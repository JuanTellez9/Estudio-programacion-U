import javax.swing.JOptionPane;
public class food {
    public static void main(String[] args) {
        int repartidores= ingresarEntero("ingrese el numero de repartidores");
        int[] puntuacion= ingresarNEnteros("ingrese la puntuacion del 1 a 5",repartidores);
        int clasificacion1=calcularCalificacion1(puntuacion);
        int clasificacion2=calcularCalificacion2(puntuacion);
        int clasificacion3=calcularCalificacion3(puntuacion);
        String mensaje=generarMensaje(repartidores,clasificacion1,clasificacion2,clasificacion3);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje){
        int valor = Integer.parseInt(javax.swing.JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int[] ingresarNEnteros(String mensaje, int cantidad) {
        int[] valores = new int[cantidad];
        for (int i = 0; i < cantidad; i++) {
            valores[i] = ingresarEntero(mensaje + " (" + (i + 1) + " de " + cantidad + "): ");
        }
        return valores;
    }
    public static int calcularCalificacion1(int[] puntuacion){
        int contador=0;
        for(int i=0;i<puntuacion.length;i++){
            if(puntuacion[i]==1||puntuacion[i]==2){
                contador++;
            }
        }return contador;
    }
    public static int calcularCalificacion2(int[] puntuacion){
        int contador=0;
        for(int i=0;i<puntuacion.length;i++){
            if(puntuacion[i]==3||puntuacion[i]==4){
                contador++;
            }
        }return contador;
    }
    public static int calcularCalificacion3(int[] puntuacion){
        int contador=0;
        for(int i=0;i<puntuacion.length;i++){
            if(puntuacion[i]==5){
                contador++;
            }
        }return contador;
    }
    public static String generarMensaje(int repartidores,int clasificacion1,int clasificacion2,int clasificacion3){
        String mensaje="registro de desempeño de los "+repartidores+" repartidores\n";
        mensaje+="Buen desempeño: "+clasificacion3+"\nRegular desempeño: "+clasificacion2+"\nMal desempeño: "+clasificacion1;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null,mensaje);
    }

}
