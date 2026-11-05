module uniquindio.edu.co.hellofx {
    requires javafx.controls;
    requires javafx.fxml;
    requires cloudinary.core;
    opens uniquindio.edu.co.hellofx.controller to javafx.fxml;
    exports uniquindio.edu.co.hellofx.app;
    exports uniquindio.edu.co.hellofx.controller;
    exports uniquindio.edu.co.hellofx.model;
}
