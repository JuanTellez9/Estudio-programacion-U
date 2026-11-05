package uniquindio.edu.co.hellofx.controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.FileChooser;
import uniquindio.edu.co.hellofx.model.AppData;
import uniquindio.edu.co.hellofx.model.Persona;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.io.IOException;
//t

public class RegistroController {

    @FXML
    private TextField txtNombre;
    @FXML
    private Button btnSeleccionar, btnGuardar;
    @FXML
    private Label lblEstado;

    private File imagenSeleccionada;
    private final AppData appData = AppData.getInstancia();

    // Configura Cloudinary con tus credenciales
    private final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dqrwt5fo7",
            "api_key", "987922296483194",
            "api_secret", "z9AKH5_ASnlzDCUs_pFk8oQnLh8"
    ));

    @FXML
    private void onSeleccionarImagen() {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Seleccionar Imagen");
        fileChooser.getExtensionFilters().add(
                new FileChooser.ExtensionFilter("Imágenes", "*.jpg", "*.png", "*.jpeg")
        );
        imagenSeleccionada = fileChooser.showOpenDialog(null);
        if (imagenSeleccionada != null) {
            lblEstado.setText("Imagen seleccionada: " + imagenSeleccionada.getName());
        }
    }

    @FXML
    private void onGuardarPersona() {
        String nombre = txtNombre.getText();

        if (nombre.isBlank() || imagenSeleccionada == null) {
            lblEstado.setText("Por favor ingresa un nombre y selecciona una imagen.");
            return;
        }

        try {
            // Subir imagen a Cloudinary
            Map uploadResult = cloudinary.uploader().upload(imagenSeleccionada, ObjectUtils.emptyMap());
            String url = uploadResult.get("secure_url").toString();

            // Crear persona y agregar al array
            Persona persona = new Persona(nombre, url);
            appData.agregarPersona(persona);

            lblEstado.setText("Persona registrada con éxito: " + persona.getNombre());
            txtNombre.clear();
            imagenSeleccionada = null;

        } catch (IOException e) {
            lblEstado.setText("Error al subir imagen: " + e.getMessage());
        }
    }

    @FXML
    private void onVerLista() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/uniquindio/edu/co/hellofx/listaview.fxml"));
            Scene scene = new Scene(loader.load());
            Stage stage = new Stage();
            stage.setTitle("Lista de Usuarios");
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            lblEstado.setText("Error al abrir la lista: " + e.getMessage());
        }
    }




}
