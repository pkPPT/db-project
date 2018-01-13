import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderForWorker {
    public int orderId;
    public String dealerId;
    public String dealerCountry;
    public String dealerCity;
    public int brandModelId;
    public String brand;
    public String model;
    public int amount;

    public OrderForWorker(int orderId, String dealerId, String dealerCountry, String dealerCity, int brandModelId, String brand, String model, int amount) {
        this.orderId = orderId;
        this.dealerId = dealerId;
        this.dealerCountry = dealerCountry;
        this.dealerCity = dealerCity;
        this.brandModelId = brandModelId;
        this.brand = brand;
        this.model = model;
        this.amount = amount;
    }


    public static ObservableList<OrderForWorker> getOrdersForWorker(Connection connection) {
        ObservableList<OrderForWorker> list = FXCollections.observableArrayList();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT do.id, do.id_dealer, do.id_brand_model, do.amount, bm.brand, bm.model , d.country, d.city " +
                    "FROM Dealer_Orders AS do " +
                    "JOIN Brand_Model AS bm ON do.id_brand_model = bm.id " +
                    "JOIN Dealer AS d ON do.id_dealer = d.id");

            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                OrderForWorker o = new OrderForWorker(rs.getInt("id"), rs.getString("id_dealer"), rs.getString("country"), rs.getString("city"),
                        rs.getInt("id_brand_model"), rs.getString("brand"), rs.getString("model"), rs.getInt("amount"));
                list.add(o);
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public static boolean signFactoryToOrder(Connection connection, Factory factory, OrderForWorker order) {
        try {
//            PreparedStatement stmt = connection.prepareStatement("INSERT INTO Production_Orders(id_dealer, id_factory, id_brand_model, amount, accomplished) " +
//                    "VALUES(?, ?, ?, ?, ?)");
            PreparedStatement stmt = connection.prepareStatement("CALL manage_order(?, ?, ?, ?)");

            stmt.setString(1, order.getDealerId());
            stmt.setInt(2, factory.getId());
            stmt.setInt(3, order.getBrandModelId());
            stmt.setInt(4, order.getAmount());

            stmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public int getOrderId() {
        return orderId;
    }

    public String getDealerId() {
        return dealerId;
    }

    public String getDealerCountry() {
        return dealerCountry;
    }

    public String getDealerCity() {
        return dealerCity;
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
}
