import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;

public class CarStore {
    int id; //PRIMARY KEY
    String dealerId;
    String country;
    String city;
    String address;

    public CarStore(int id, String dealerId, String country, String city, String address) {
        this.id = id;
        this.dealerId = dealerId;
        this.country = country;
        this.city = city;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public String getDealerId() {
        return dealerId;
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

    public static ObservableList<CarStore> getCarStoreList(Connection connection, String dealerId) {
        ObservableList<CarStore> list = FXCollections.observableArrayList();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM car_store WHERE car_store.id_dealer = ?");
            stmt.setString(1, dealerId);

            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {
                CarStore cS = new CarStore(rs.getInt("id"), rs.getString("id_dealer"),
                        rs.getString("country"), rs.getString("city"), rs.getString("address"));
                list.add(cS);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }
        return list;
    }

    public static boolean addCarStore(Connection connection, String dealerId, String country, String city, String address) {
        try {
//            PreparedStatement stmt = connection.prepareStatement("INSERT INTO Car_Store(id_dealer, country, city, address) " +
//                    "VALUES( ?, ?, ?, ?)");
            PreparedStatement stmt = connection.prepareStatement("CALL add_car_store(?, ?, ?, ?)");
            stmt.setString(1, dealerId);
            stmt.setString(2, country);
            stmt.setString(3, city);
            stmt.setString(4, address);

            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean deleteCarStore(Connection connection, CarStore carStore) {
        try {
//            PreparedStatement stmt = connection.prepareStatement("DELETE FROM Car_Store WHERE ID = ?");
            PreparedStatement stmt = connection.prepareStatement("CALL delete_car_store(?)");
            stmt.setInt(1, carStore.getId());
            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
