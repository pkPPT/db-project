import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;

public class FactoryModel {
    int factoryId;
    int modelId;
    String brandModel;
    String factoryProperties;

    public FactoryModel(int factoryId, int modelId, String brandModel, String factoryProperties) {
        this.factoryId = factoryId;
        this.modelId = modelId;
        this.brandModel = brandModel;
        this.factoryProperties = factoryProperties;
    }

    public int getFactoryId() {
        return factoryId;
    }

    public int getModelId() {
        return modelId;
    }

    public String getBrandModel() {
        return brandModel;
    }

    public String getFactoryProperties() {
        return factoryProperties;
    }

    public static ObservableList<FactoryModel> getFactoryModelList(Connection connection, Factory factory) {
        ObservableList<FactoryModel> list = FXCollections.observableArrayList();

        String query = "SELECT fm.id_factory, fm.id_brand_model, bm.brand, bm.model, f.country, f.city, f.address " +
                "FROM Factory_Model AS fm " +
                "JOIN Brand_Model AS bm ON fm.id_brand_model = bm.id " +
                "JOIN Factory AS f ON fm.id_factory = f.id " +
                "WHERE fm.id_factory = " + factory.getId();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                FactoryModel fm = new FactoryModel(rs.getInt("id_factory"), rs.getInt("id_brand_model"),
                        rs.getString("brand") + "/" + rs.getString("model"),
                        rs.getInt("id_factory") + "/" + rs.getString("country") + "/" + rs.getString("city") + "/" + rs.getString("address"));
                list.add(fm);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }

        return list;
    }

    public static ObservableList<FactoryModel> getFactoryModelList(Connection connection, BrandModel brandModel) {
        ObservableList<FactoryModel> list = FXCollections.observableArrayList();

        String query = "SELECT fm.id_factory, fm.id_brand_model, bm.brand, bm.model, f.country, f.city, f.address " +
                "FROM Factory_Model AS fm " +
                "JOIN Brand_Model AS bm ON fm.id_brand_model = bm.id " +
                "JOIN Factory AS f ON fm.id_factory = f.id " +
                "WHERE fm.id_brand_model = " + brandModel.getId();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                FactoryModel fm = new FactoryModel(rs.getInt("id_factory"), rs.getInt("id_brand_model"),
                        rs.getString("brand") + "/" + rs.getString("model"),
                        rs.getInt("id_factory") + "/" + rs.getString("country") + "/" + rs.getString("city") + "/" + rs.getString("address"));
                list.add(fm);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }

        return list;
    }

    public static ObservableList<FactoryModel> getFactoryModelList(Connection connection, BrandModel brandModel, Factory factory) {
        ObservableList<FactoryModel> list = FXCollections.observableArrayList();

        String query = "SELECT fm.id_factory, fm.id_brand_model, bm.brand, bm.model, f.country, f.city, f.address " +
                "FROM Factory_Model AS fm " +
                "JOIN Brand_Model AS bm ON fm.id_brand_model = bm.id " +
                "JOIN Factory AS f ON fm.id_factory = f.id " +
                "WHERE fm.id_brand_model = " + brandModel.getId() +
                " AND fm.id_factory = " + factory.getId();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                FactoryModel fm = new FactoryModel(rs.getInt("id_factory"), rs.getInt("id_brand_model"),
                        rs.getString("brand") + "/" + rs.getString("model"),
                        rs.getInt("id_factory") + "/" + rs.getString("country") + "/" + rs.getString("city") + "/" + rs.getString("address"));
                list.add(fm);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }

        return list;
    }

    public static ObservableList<FactoryModel> getAll(Connection connection) {
        ObservableList<FactoryModel> list = FXCollections.observableArrayList();

        String query = "SELECT fm.id_factory, fm.id_brand_model, bm.brand, bm.model, f.country, f.city, f.address " +
                "FROM Factory_Model AS fm " +
                "JOIN Brand_Model AS bm ON fm.id_brand_model = bm.id " +
                "JOIN Factory AS f ON fm.id_factory = f.id";
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                FactoryModel fm = new FactoryModel(rs.getInt("id_factory"), rs.getInt("id_brand_model"),
                        rs.getString("brand") + "/" + rs.getString("model"),
                        rs.getInt("id_factory") + "/" + rs.getString("country") + "/" + rs.getString("city") + "/" + rs.getString("address"));
                list.add(fm);
            }
        } catch(SQLException ex) { ex.printStackTrace(); }

        return list;
    }

    public static ObservableList<BrandModel> getModels(Factory factory, ObservableList<BrandModel> brandModels) {
        ObservableList<BrandModel> models = FXCollections.observableArrayList();

        return models;
    }

    public static boolean addFactoryModel(Connection connection, int factoryId, int modelId) {
        try {
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO Factory_Model(id_factory, id_brand_model) " +
                    "VALUES( ?, ?)");
            stmt.setInt(1, factoryId);
            stmt.setInt(2, modelId);

            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
