import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

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

    public static boolean addDealer(String country, String city, String address, String number) {
        //TODO
        return true;
    }

    public static ObservableList<Dealer> getDealers() {
        ObservableList<Dealer> list = FXCollections.observableArrayList();

        return list;
    }
}
