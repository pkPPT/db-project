import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.Connection;

public class Order {
    public int id;
    public int factoryId;
    public String brand;
    public String model;
    public int amount;
    public boolean accomplished;

    public Order(int id, int factoryId, String brand, String model, int amount, boolean accomplished) {
        this.id = id;
        this.factoryId = factoryId;
        this.brand = brand;
        this.model = model;
        this.amount = amount;
        this.accomplished = accomplished;
    }

    public int getId() {
        return id;
    }

    public int getFactoryId() {
        return factoryId;
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

    public static boolean setAsAccomplished(Order order) {
        //TODO - set Order as accomplished in database
        return true;
    }

    public static ObservableList<Order> getOrders(Connection connection) {
        ObservableList<Order> list = FXCollections.observableArrayList();
        list.add(new Order(1, 1, "brand", "model", 123, false));
        list.add(new Order(2, 1, "brand", "model", 100, false));
        list.add(new Order(3, 1, "brand1", "model1", 21312, false));
        list.add(new Order(4, 1, "brand2", "model2", 100, false));
        list.add(new Order(5, 1, "brand3", "model3", 2000, false));
        return list;
    }

    public static boolean addOrder(String brand, String model, String amount) {
        //TODO
        return true;
    }
}
