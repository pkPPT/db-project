import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.util.ArrayList;

public class FactoryModel {
    int factoryId;
    int modelId;

    public FactoryModel(int factoryId, int modelId) {
        this.factoryId = factoryId;
        this.modelId = modelId;
    }

    public int getFactoryId() {
        return factoryId;
    }

    public int getModelId() {
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
