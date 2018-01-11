import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.util.ArrayList;

public class FactoryModel {
    String factoryId;
    String modelId;

    public FactoryModel(String factoryId, String modelId) {
        this.factoryId = factoryId;
        this.modelId = modelId;
    }

    public String getFactoryId() {
        return factoryId;
    }

    public String getModelId() {
        return modelId;
    }

    public static ObservableList<FactoryModel> getFactoryModelList(Factory factory) {
        ObservableList<FactoryModel> list = FXCollections.observableArrayList();
        //TODO
        return list;
    }

    public static ObservableList<FactoryModel> getAll() {
        ObservableList<FactoryModel> list = FXCollections.observableArrayList();
        //TODO
        return list;
    }

    public static ArrayList<BrandModel> getModels(Factory factory) {
        ArrayList<BrandModel> models = new ArrayList<>();

        return models;
    }
}
