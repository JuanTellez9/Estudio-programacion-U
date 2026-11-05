package model;

public class Metodos {

    public String parImpar (int numero){
        int residuo= numero % 2;
        if(residuo ==0){
            System.out.println("es par");
        }else{
            System.out.println("es impar");
        }
    }

    public int sumaPares(int[] numeros) {
        int suma = 0; 
    
        for (int i = 0; i < numeros.length; i++) {
        int residuo=numeros[i]%2;
        if(residuo==0){
            suma+=numeros[i];
        }
        }
    return suma;
    }
}