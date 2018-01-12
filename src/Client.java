import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;
import org.mariadb.jdbc.*;

public class Client extends Application {
    ClientController controller;
    Connection connection;
    String url;

    static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";

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
            url = "jdbc:mariadb://localhost:3306/concerndb";
        } catch(IOException e) { e.printStackTrace(); }
    }

    public boolean connectToDatabase(String login, String password, String accType) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(url, login, password);
            System.out.println("Connected to database...");
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        } catch(ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public boolean disconnect() {
        try {
            connection.close();
            System.out.println("Connection closed...");
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}