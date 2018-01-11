import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class Order {
    public String id;
    public String brand;
    public String model;
    public String amount;
    public String accomplished;

    public Order(String id, String brand, String model, String amount, String accomplished) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.amount = amount;
        this.accomplished = accomplished;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public String getAmount() {
        return amount;
    }

    public String getAccomplished() {
        return accomplished;
    }

    public static boolean setAsAccomplished(Order order) {
        //TODO - set Order as accomplished in database
        return true;
    }

    public static ObservableList<Order> getOrders() {
        ObservableList<Order> list = FXCollections.observableArrayList();
        list.add(new Order("1", "brand", "model", "amount", "no"));
        list.add(new Order("2", "brand", "model", "amount", "no"));
        list.add(new Order("3", "brand1", "model1", "21312", "no"));
        list.add(new Order("4", "brand2", "model2", "100", "no"));
        list.add(new Order("5", "brand3", "model3", "2000", "no"));
        return list;
    }
}
