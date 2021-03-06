import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;

public class Factory {
    public int id;
    public String country;
    public String city;
    public String address;
    public int number;
    public int workers;

    public Factory(int id, String country, String city, String address, int number, int workers) {
        this.id = id;
        this.country = country;
        this.city = city;
        this.address = address;
        this.number = number;
        this.workers = workers;
    }

    public String getProperties() {
        return id + "/" + country + "/" + city + "/" + address;
    }

    public int getId() {
        return id;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getAddress() {
        return address;
    }

    public int getNumber() {
        return number;
    }

    public int getWorkers() {
        return workers;
    }

    public static ObservableList<Factory> getFactories(Connection connection) {
        ObservableList<Factory> factories = FXCollections.observableArrayList();
        String query = "SELECT * FROM Factory WHERE is_available = TRUE";
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                Factory f = new Factory(rs.getInt("id"), rs.getString("country"),
                        rs.getString("city"), rs.getString("address"), rs.getInt("phone_number"),
                        rs.getInt("workers"));
                factories.add(f);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }

        return factories;
    }

    public static boolean addFactory(Connection connection, String country, String city, String address, String number) {
        try {
//            PreparedStatement stmt = connection.prepareStatement("INSERT INTO Factory(country, city, address, phone_number, workers) " +
//                    "VALUES( ?, ?, ?, ?, ?)");
            PreparedStatement stmt = connection.prepareStatement("CALL add_factory(?, ?, ?, ?, ?)");
            stmt.setString(1, country);
            stmt.setString(2, city);
            stmt.setString(3, address);
            stmt.setString(4, number);
            stmt.setInt(5, 0);

            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean deleteFactory(Connection connection, Factory factory) {
        try {
//            PreparedStatement stmt = connection.prepareStatement("DELETE FROM Factory WHERE id = ?");
            PreparedStatement stmt = connection.prepareStatement("CALL delete_factory(?)");
            stmt.setInt(1, factory.getId());
            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public static ObservableList<Factory> showFactoriesForOrder(Connection connection, OrderForWorker order) {
        ObservableList<Factory> list = FXCollections.observableArrayList();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT f.id, f.country, f.city, f.address, f.phone_number, f.workers " +
                    "FROM Factory AS f " +
                    "JOIN Factory_Model AS fm ON f.id = fm.id_factory " +
                    "JOIN Dealer_Orders AS do ON fm.id_brand_model = do.id_brand_model " +
                    "WHERE do.id = ? AND f.is_available = TRUE");

            stmt.setInt(1, order.getOrderId());

            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                Factory f = new Factory(rs.getInt("id"), rs.getString("country"), rs.getString("city"),
                        rs.getString("address"), rs.getInt("phone_number"), rs.getInt("workers"));
                list.add(f);
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
}
