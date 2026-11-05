import java.util.List;
import java.util.stream.Collectors;

public class App {
    public static void main(String[] args) throws Exception {
        List<Integer> numeros = List.of(1, 2, 3, 4, 5, 6);

        List<Integer> pares = numeros.stream()
            .filter(n -> n % 2 == 0)
            .map(n -> n * 2)
            .collect(Collectors.toList());

        System.out.println(pares);
    }
}
