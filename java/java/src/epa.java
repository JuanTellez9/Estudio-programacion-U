import javax.swing.JOptionPane;
public class epa {
    public static final double AUMENTO1=0.15;
    public static final double AUMENTO2=0.25;
    public static void main(String[] args) {
        double valorRecibo=ingresarRealD("Por favor,ingresar el valor del recibo:");
        double consumo=ingresarRealD("Por favor,ingresar su consumo del mes en metros cubicos:");
        double valor=calcularValor(valorRecibo,consumo);
        double porcentaje=calcularPorcentaje(valor,consumo);
        double valortotal=calcularValorTotal(valor,porcentaje);
        String mensaje=generarMensaje(valortotal);
        mostrarMensaje(mensaje);
    }
    public static double ingresarRealD(String mensaje) {
        return Double.parseDouble(JOptionPane.showInputDialog(mensaje));
    }
    public static double calcularValor(double valorRecibo,double consumo){
        double valor=valorRecibo*consumo;
        return valor;
    }
    public static double calcularPorcentaje(double valor,double consumo){
        double porcentaje;
        if(consumo>=1 && consumo<=15){
        porcentaje=valor*AUMENTO1;
    }else{
        porcentaje=valor*AUMENTO2;
    }
    return porcentaje;
}
    public static double calcularValorTotal(double valor,double porcentaje){
        double valortotal=valor+porcentaje;
        return valortotal;
    }
    public static String generarMensaje(double valorTotal){
        String mensaje="El almuento del valor del servicio:"+valorTotal;
        return mensaje;
    }
    public static void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
