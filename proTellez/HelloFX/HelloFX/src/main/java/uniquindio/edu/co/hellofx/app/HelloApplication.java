package uniquindio.edu.co.hellofx.app;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class HelloApplication extends Application {
    @Override
    public void start(Stage stage) throws Exception {
        FXMLLoader fxmlLoader = new FXMLLoader(
                getClass().getResource("/uniquindio/edu/co/hellofx/registro-view.fxml")
        );
        Scene scene = new Scene(fxmlLoader.load(), 400, 300);
        stage.setTitle("Registro de Personas");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
