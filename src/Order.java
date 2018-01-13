import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Order {
    public int id;
    public String dealerId;
    public int factoryId;
    public int brandModelId;
    public String brand;
    public String model;
    public int amount;
    public boolean accomplished;

    public Order(int id, String dealerId, int factoryId, int brandModelId, String brand, String model, int amount, boolean accomplished) {
        this.id = id;
        this.dealerId = dealerId;
        this.factoryId = factoryId;
        this.brandModelId = brandModelId;
        this.brand = brand;
        this.model = model;
        this.amount = amount;
        this.accomplished = accomplished;
    }

    public int getId() {
        return id;
    }

    public String getDealerId() {
        return dealerId;
    }

    public int getFactoryId() {
        return factoryId;
    }

    public int getBrandModelId() {
        return brandModelId;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public int getAmount() {
        return amount;
    }

    public boolean getAccomplished() {
        return accomplished;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public static boolean setAsAccomplished(Connection connection, Order order) {
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE production_orders SET accomplished = TRUE WHERE id = ?");
            stmt.setInt(1, order.getId());

            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public static ObservableList<Order> getOrdersForFactory(Connection connection, int factoryId) {
        ObservableList<Order> list = FXCollections.observableArrayList();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT po.id, po.id_dealer, po.id_factory, po.id_brand_model, " +
                    "po.amount, po.accomplished, bm.brand, bm.model " +
                    "FROM Production_Orders AS po " +
                    "JOIN Brand_Model AS bm ON po.id_brand_model = bm.id WHERE id_factory = ? AND accomplished = FALSE");
            stmt.setInt(1, factoryId);

            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                Order o = new Order(rs.getInt("id"), rs.getString("id_dealer"), rs.getInt("id_factory"), rs.getInt("id_brand_model"),
                        rs.getString("brand"), rs.getString("model"), rs.getInt("amount"), rs.getBoolean("accomplished"));
                list.add(o);
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public static ObservableList<Order> getOrdersForDealer(Connection connection, String dealerId) {
        ObservableList<Order> list = FXCollections.observableArrayList();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT do.id, do.id_dealer, do.id_brand_model, do.amount, bm.brand, bm.model " +
                    "FROM Dealer_Orders AS do " +
                    "JOIN Brand_Model AS bm ON do.id_brand_model = bm.id " +
                    "WHERE do.id_dealer = ?");
            stmt.setString(1, dealerId);

            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                Order o = new Order(rs.getInt("id"), rs.getString("id_dealer"), 0, rs.getInt("id_brand_model"),
                        rs.getString("brand"), rs.getString("model"), rs.getInt("amount"), false);
                list.add(o);
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public static boolean addOrder(Connection connection, String dealerId, String brand, String model, String amount) {
        try {
            int idBrandModel;
            PreparedStatement stmt1 = connection.prepareStatement("SELECT id FROM Brand_Model WHERE brand = ? AND model = ?");
            stmt1.setString(1, brand);
            stmt1.setString(2, model);

            ResultSet rs1 = stmt1.executeQuery();
            rs1.next();
            idBrandModel = rs1.getInt("id");

            PreparedStatement stmt2 = connection.prepareStatement("INSERT INTO Dealer_Orders(id_dealer, id_brand_model, amount) VALUES(?, ?, ?)");
            stmt2.setString(1, dealerId);
            stmt2.setInt(2, idBrandModel);
            stmt2.setInt(3, Integer.parseInt(amount));

            stmt2.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
