import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.Stack;

public class Client extends Application {
    ClientController controller;

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(this.getClass().getResource("/client.fxml"));

        controller = new ClientController(this);
        loader.setController(controller);
        try {
            StackPane stackPane = loader.load();
            Scene scene = new Scene(stackPane);

            primaryStage.setScene(scene);
            primaryStage.setTitle("Title");
            primaryStage.show();
        } catch(IOException e) { e.printStackTrace(); }
    }

    public boolean connectToDatabase(String login, String password, String accType) {
        return true;
    }

    public boolean disconnect() {
        return true;
    }
}