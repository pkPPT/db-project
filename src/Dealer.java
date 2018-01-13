import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;

public class Dealer {
    String id;
    String country;
    String city;
    String address;
    int number;

    public Dealer(String id, String country, String city, String address, int number) {
        this.id = id;
        this.country = country;
        this.city = city;
        this.address = address;
        this.number = number;
    }

    public String getId() {
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

    public static boolean addDealer(Connection connection, String id, String country, String city, String address, String number) {
        try {
//            PreparedStatement stmt = connection.prepareStatement("INSERT INTO Dealer(id, country, city, address, phone_number) " +
//                    "VALUES( ?, ?, ?, ?, ?)");
            PreparedStatement stmt = connection.prepareStatement("CALL add_dealer(?, ?, ?, ?, ?)");
            stmt.setString(1, id);
            stmt.setString(2, country);
            stmt.setString(3, city);
            stmt.setString(4, address);
            stmt.setInt(5, Integer.parseInt(number));

            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean deleteDealer(Connection connection, Dealer dealer) {
        try {
//            PreparedStatement stmt = connection.prepareStatement("DELETE FROM Dealer WHERE id = ?");
            PreparedStatement stmt = connection.prepareStatement("CALL delete_dealer(?)");
            stmt.setString(1, dealer.getId());
            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public static ObservableList<Dealer> getDealers(Connection connection) {
        ObservableList<Dealer> list = FXCollections.observableArrayList();

        String query = "SELECT * FROM Dealer WHERE Dealer.is_available = TRUE";
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                Dealer d = new Dealer(rs.getString("id"), rs.getString("country"),
                        rs.getString("city"), rs.getString("address"), rs.getInt("phone_number"));
                list.add(d);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }

        return list;
    }
}
