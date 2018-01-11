import java.util.ArrayList;

public class BrandModel {
    String id;
    String brand;
    String model;
    String inProduction;

    public BrandModel(String id, String brand, String model, String inProduction) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.inProduction = inProduction;
    }

    public String getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public String getInProduction() {
        return inProduction;
    }

    public static ArrayList<BrandModel> getBrandModels() {
        ArrayList<BrandModel> list = new ArrayList<>();
        //TODO - get table from database
        return list;
    }

    public static boolean addBrandModel(String brand, String model) {
        return true;
    }
}
