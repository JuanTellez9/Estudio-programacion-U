import javax.swing.JOptionPane;
public class happy {
    public static void main(String[] args) {
        String genero=ingresarTexto("ingrese su genero:");
        int fecha=ingresarEntero("ingrese el numero de nacimiento:");
        int cuenta=ingresarEntero("ingresar valor de la cuenta:");
        double descuento=calcularDescuento(genero,fecha,cuenta);
        String mensaje=generarMensaje(genero,fecha,descuento);
        mostrarMensaje(mensaje);

    }
    public static int ingresarEntero(String mensaje){
        int valor = Integer.parseInt(JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static String ingresarTexto(String mensaje){
        String texto= JOptionPane.showInputDialog(mensaje);
        return texto;
    }
    public static double calcularDescuento(String genero,int fecha,int cuenta){
        double descuento;
        int menos=cuenta;
        if(genero.equals("hombre")){
            if(fecha>=1&&fecha<=2){
                descuento=cuenta*0.07;
                menos-=descuento;
            }else if(fecha>=3&&fecha<=14||fecha>=17&&fecha<=21){
                descuento=cuenta*0.10;
                menos-=descuento;
            }else if(fecha>=15&&fecha<=16){
                descuento=cuenta*0.09;
                menos-=descuento;
            }else{
                descuento=cuenta*0.03;
                menos-=descuento;
            }
        }else if(fecha%2==0){
            descuento=cuenta*0.10;
                menos-=descuento;
        }else{
            descuento=cuenta*0.07;
                menos-=descuento;
        }return menos;
    }
    public static String generarMensaje(String genero,int fecha,double descuento){ 
        String mensaje="su genero es: "+genero+"\n su fecha de nacimiento es: "+fecha+"\n su cuenta es: "+descuento;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje){
        JOptionPane.showMessageDialog(null,mensaje);
    }

}
