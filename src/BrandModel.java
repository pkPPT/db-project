import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;

public class BrandModel {
    int id;
    String brand;
    String model;
    boolean inProduction;

    public BrandModel(int id, String brand, String model, boolean inProduction) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.inProduction = inProduction;
    }

    public int getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public boolean getInProduction() {
        return inProduction;
    }

    public static ObservableList<BrandModel> getBrandModels(Connection connection) {
        ObservableList<BrandModel> list = FXCollections.observableArrayList();

        String query = "SELECT * FROM Brand_Model";
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                BrandModel bM = new BrandModel(rs.getInt("id"), rs.getString("brand"), rs.getString("model"),
                        rs.getBoolean("in_production"));
                list.add(bM);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }

        return list;
    }

    public static boolean addBrandModel(Connection connection, String brand, String model) {
        try {
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO Brand_Model(brand, model, in_production) " +
                    "VALUES( ?, ?, ?)");
            stmt.setString(1, brand);
            stmt.setString(2, model);
            stmt.setBoolean(3, false);

            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean deleteBrandModel(Connection connection, BrandModel brandModel) {
        try {
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM Brand_Model WHERE id = ?");
            stmt.setInt(1, brandModel.getId());
            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
