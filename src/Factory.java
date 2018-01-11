import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.util.ArrayList;

public class Factory {
    public String id;
    public String country;
    public String city;
    public String address;
    public String number;
    public String workers;

    public Factory(String id, String country, String city, String address, String number, String workers) {
        this.id = id;
        this.country = country;
        this.city = city;
        this.address = address;
        this.number = number;
        this.workers = workers;
    }

    public String getProperties() {
        return id + "/" + country + "/" + city + "/" + address;
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

    public String getNumber() {
        return number;
    }

    public String getWorkers() {
        return workers;
    }

    public static ObservableList<Factory> getFactories() {
        ObservableList<Factory> factories = FXCollections.observableArrayList();
        factories.add(new Factory("id", "country", "city", "address", "number", "workers"));
        factories.add(new Factory("1", "countrya", "citya", "address123", "65465454", "1"));
        factories.add(new Factory("id", "country", "city", "address", "number", "workers"));
        factories.add(new Factory("2", "countryb", "cityb", "addresssdasd 12", "659458451", "1236"));
        factories.add(new Factory("id", "country", "city", "address", "number", "workers"));
        factories.add(new Factory("id", "country", "city", "address", "number", "workers"));
        return factories;
    }

    public static ArrayList<Factory> getFactoryList() {
        ArrayList<Factory> list = new ArrayList<>();
        //TODO - get table from database
        return list;
    }

    public static boolean addFactory(String country, String city, String address, String number) {
        //TODO - add factory to database
        return true;
    }

    public static boolean deleteFactory(Factory factory) {
        //TODO - remove factory from database
        return true;
    }
}
