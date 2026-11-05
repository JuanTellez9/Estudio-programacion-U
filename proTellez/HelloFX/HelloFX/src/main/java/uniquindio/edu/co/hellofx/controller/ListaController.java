package uniquindio.edu.co.hellofx.controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.stage.Stage;
import javafx.scene.control.cell.PropertyValueFactory;
import uniquindio.edu.co.hellofx.model.AppData;
import uniquindio.edu.co.hellofx.model.Persona;

public class ListaController {

    @FXML private TableView<Persona> tablaUsuarios;
    @FXML private TableColumn<Persona, String> colNombre;
    @FXML private TableColumn<Persona, String> colImagen;

    private final ObservableList<Persona> listaObservable =
            FXCollections.observableArrayList();

    @FXML
    private void initialize() {
        // Vincular columnas con atributos
        colNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colImagen.setCellValueFactory(new PropertyValueFactory<>("imagenUrl"));

        // Llenar tabla con los datos de AppData
        listaObservable.addAll(AppData.getInstancia().getPersonas());
        tablaUsuarios.setItems(listaObservable);
    }

    @FXML
    private void onCerrarVentana() {
        Stage stage = (Stage) tablaUsuarios.getScene().getWindow();
        stage.close();
    }
}
