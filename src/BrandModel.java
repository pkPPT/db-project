import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

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

    public static ObservableList<BrandModel> getBrandModels() {
        ObservableList<BrandModel> list = FXCollections.observableArrayList();
        //TODO - get table from database
        return list;
    }

    public static boolean addBrandModel(String brand, String model) {
        return true;
    }
}
