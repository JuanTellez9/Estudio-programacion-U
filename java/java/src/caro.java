public class caro {
    public static void main(String[] args) {
        int numero1=ingresarEnteroMayorque("Ingrese el primer numero:",0);
        int numero2=ingresarEnteroMayorque("Ingrese el segundo numero:",numero1);
        int sumaPares=calcularSumaPares(numero1,numero2);
        int sumaImpares=calcularSumaImpares(numero1,numero2);
        String mensaje=generarMensaje(numero1,numero2,sumaPares,sumaImpares);
        mostrarMensaje(mensaje);
    }
    public static int ingresarEntero(String mensaje) {
        int valor=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(mensaje));
        return valor;
    }
    public static int ingresarEnteroMayorque(String mensaje, int valorMinimo) {
        boolean repetir = true;
        double valor = 0;
        while (repetir) {
            valor = ingresarEntero(mensaje);
            if (valor < valorMinimo) {
                System.out.println("El valor no es mayor que " + valorMinimo);
            } else {
                repetir = false;
            }
        }
        return (int) valor;
    }
    public static int calcularSumaPares(int numero1,int numero2){
        int suma=0;
        for(int i=numero1;i<=numero2;i++){
            if(i%2==0){
                suma+=i;
            }
        }
        return suma;
    }
    public static int calcularSumaImpares(int numero1,int numero2){
        int sumai=0;
        for(int i=numero1;i<=numero2;i++){
            if(i%2!=0){
                sumai+=i;
            }
        }
        return sumai;
    }
    public static String generarMensaje(int numero1,int numero2,int sumaPares,int sumaImpares){
        String mensaje="En el rango de "+numero1+" y "+numero2+"\nla sema de los pares son:"+sumaPares+"\nla suma de los impares es:"+sumaImpares;
        return mensaje;
    }

    public static void mostrarMensaje(String mensaje) {
        javax.swing.JOptionPane.showMessageDialog(null, mensaje);
      }
}
    

