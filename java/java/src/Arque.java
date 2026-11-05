public class Arque {
    public static void main (String[]args){
    int numero = ingresarEntero("Ingrese el numero: ");
    String impares = determinar(numero);
    mostrarMensaje(impares);
    }

    public static int ingresarEntero(String mensaje){
        int valor = 0;
        boolean valido = false;
        while(!valido){
            try{
                valor = Integer.parseInt(System.console().readLine(mensaje));
                valido = true;
            }catch(NumberFormatException e){
                System.out.println("Error: Debe ingresar un número entero.");
            }
        }
        return valor;
    }
    public static String determinar(int numero){
        String impares="Los numeros primos son: \n";
        int i;
        int n;
        boolean bandera = true;
        for(n=2; n<= numero; n++){
            for(i=2;i<n;i++){
                if(n%i==0){
                    bandera=false;
                }
            }
            if(bandera == true){
                impares+= n+" ";
                
            }
            bandera=true;
            
        }
        return impares;
       
    }


    public static void mostrarMensaje(String mensaje){
        System.out.println(mensaje);
    }
}