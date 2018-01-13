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

    String dealerId = null;
    int carStoreId = 0;
    int factoryId = 0;
    boolean isWorker = false;
    boolean isCompany = false;

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
            if(checkAccType(login, accType)) {
                return true;
            }
            else {
                disconnect();
                return false;
            }
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
            dealerId = null;
            carStoreId = 0;
            factoryId = 0;
            isWorker = false;
            isCompany = false;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    private boolean checkAccType(String login, String accType) {
        String query = "SELECT * FROM users WHERE users.login = '" +  login + "'";
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM users WHERE users.login = ?");
            stmt.setString(1, login);

            ResultSet rs = stmt.executeQuery();
            rs.next();

            switch (accType) {
                case("Company"):
                    boolean isCompany = rs.getBoolean("is_company");
                    this.isCompany = isCompany;
                    return isCompany;

                case("Factory"):
                    int factoryId = rs.getInt("factory_id");
                    this.factoryId = factoryId;
                    if(factoryId == 0) {
                        return false;
                    }
                    return true;

                case("Dealer"):
                    String dealerId = rs.getString("dealer_id");
                    this.dealerId = dealerId;
                    if(dealerId == null) {
                        return false;
                    }
                    return true;

                case("Car Store"):
                    int carStoreId = rs.getInt("car_store_id");
                    this.carStoreId = carStoreId;
                    if(carStoreId == 0) {
                        return false;
                    }
                    return true;

                case("Company Worker"):
                    boolean isWorker = rs.getBoolean("is_worker");
                    this.isWorker = isWorker;
                    return isWorker;

                default:
                    return false;
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}