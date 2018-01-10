import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class Order {
    public String brand;
    public String model;
    public String amount;
    public String accomplished;

    public Order(String brand, String model, String amount, String accomplished) {
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
        list.add(new Order("brand", "model", "amount", "no"));
        list.add(new Order("brand", "model", "amount", "no"));
        list.add(new Order("brand1", "model1", "21312", "no"));
        list.add(new Order("brand2", "model2", "100", "no"));
        list.add(new Order("brand3", "model3", "2000", "no"));
        return list;
    }
}
