import com.sun.org.apache.xpath.internal.operations.Or;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.StackPane;

import java.sql.Connection;
import java.util.ArrayList;


public class ClientController {
    Client client;
    ObservableList<BrandModel> brandModelList = FXCollections.observableArrayList();
    ObservableList<Factory> factoryList = FXCollections.observableArrayList();
    ObservableList<FactoryModel> factoryModelList = FXCollections.observableArrayList();
    ObservableList<Dealer> dealersList = FXCollections.observableArrayList();
    ObservableList<CarStore> carStoreList = FXCollections.observableArrayList();
    ObservableList<Order> orderList = FXCollections.observableArrayList();
    ObservableList<OrderForWorker> orderForWorkerList = FXCollections.observableArrayList();

    //LOGIN
    @FXML
    private StackPane loginView;
    @FXML
    private TextField loginField;
    @FXML
    private PasswordField passwordField;
    @FXML
    private ChoiceBox<String> accountTypeBox;
    @FXML
    private Button loginButton;
    @FXML
    private Label loginErrorLabel;

    //COMPANY
    @FXML
    private StackPane companyView;
    @FXML
    private ChoiceBox<String> companyToolBox;
    @FXML
    private Button companyOKButton;

    //FACTORY
    @FXML
    private StackPane factoryView;
    @FXML
    private TableView<Order> factoryOrdersTable;
    @FXML
    private TableColumn<Order, String> factoryOrdersTableBrand;
    @FXML
    private TableColumn<Order, String> factoryOrdersTableModel;
    @FXML
    private TableColumn<Order, String> factoryOrdersTableAmount;
    @FXML
    private TableColumn<Order, String> factoryOrdersTableAccomplished;
    @FXML
    private Button setOrderStateButton;

    //DEALER
    @FXML
    private StackPane dealerView;
    @FXML
    private ChoiceBox<String> dealerToolBox;
    @FXML
    private Button dealerOKButton;

    //CAR STORE
    @FXML
    private StackPane carStoreView;
    @FXML
    private Label carStoreNameLabel;
    @FXML
    private ChoiceBox<String> transactionModelBox;
    @FXML
    private ChoiceBox<String> transactionTypeBox;
    @FXML
    private Button addTransactionButton;
    @FXML
    private Label transactionInfoLabel;

    //COMPANY WORKER
    @FXML
    private StackPane companyWorkerView;
    @FXML
    private Button signToFactoryButton;
    @FXML
    private Button showFactoriesButton;
    @FXML
    private TableView<OrderForWorker> workerOrdersTable;
    @FXML
    private TableColumn<OrderForWorker, String> workerOrdersTableBrand;
    @FXML
    private TableColumn<OrderForWorker, String> workerOrdersTableModel;
    @FXML
    private TableColumn<OrderForWorker, Integer> workerOrdersTableAmount;
    @FXML
    private TableColumn<OrderForWorker, String> workerOrdersTableCountry;
    @FXML
    private TableColumn<OrderForWorker, String> workerOrdersTableCity;
    @FXML
    private TableView<Factory> workerFactoryTable;
    @FXML
    private TableColumn<Factory, String> workerFactoryTableCountry;
    @FXML
    private TableColumn<Factory, String> workerFactoryTableCity;
    @FXML
    private TableColumn<Factory, String> workerFactoryTableAddress;
    @FXML
    private TableColumn<Factory, Integer> workerFactoryTableNumber;


    //FACTORY MANAGEMENT
    @FXML
    private StackPane factoryManagementView;
    @FXML
    private TableView<Factory> factoriesTable;
    @FXML
    private TableColumn<Factory, Integer> factoriesTableID;
    @FXML
    private TableColumn<Factory, String> factoriesTableCountry;
    @FXML
    private TableColumn<Factory, String> factoriesTableCity;
    @FXML
    private TableColumn<Factory, String> factoriesTableAddress;
    @FXML
    private  TableColumn<Factory, Integer> factoriesTableNumber;
    @FXML
    private TextField newFactoryCountryField;
    @FXML
    private TextField newFactoryCityField;
    @FXML
    private TextField newFactoryAddressField;
    @FXML
    private TextField newFactoryNumberField;
    @FXML
    private Button addFactoryButton;
    @FXML
    private Button deleteFactoryButton;

    //FACTORY-MODEL MANAGEMENT
    @FXML
    private StackPane factoryModelManagementView;
    @FXML
    private ChoiceBox<String> factoryModelBoxModel;
    @FXML
    private ChoiceBox<String> factoryModelBoxFactory;
    @FXML
    private Button signModelToFactoryButton;
    @FXML
    private Button removeModelFromFactoryButton;
    @FXML
    private TableView<FactoryModel> factoryModelTable;
    @FXML
    private TableColumn<FactoryModel, String> factoryModelTableModel;
    @FXML
    private TableColumn<FactoryModel, Integer> factoryModelTableFactory;

    //DEALER MANAGEMENT
    @FXML
    private StackPane dealerManagementView;
    @FXML
    private Button removeDealerButton;
    @FXML
    private Button addDealerButton;
    @FXML
    private TextField addDealerIdField;
    @FXML
    private TextField addDealerCountryField;
    @FXML
    private TextField addDealerCityField;
    @FXML
    private TextField addDealerAddressField;
    @FXML
    private TextField addDealerNumberField;
    @FXML
    private TableView<Dealer> dealersTable;
    @FXML
    private TableColumn<Dealer, String> dealersTableId;
    @FXML
    private TableColumn<Dealer, String> dealersTableCountry;
    @FXML
    private TableColumn<Dealer, String> dealersTableCity;
    @FXML
    private TableColumn<Dealer, String> dealersTableAddress;
    @FXML
    private TableColumn<Dealer, Integer> dealersTableNumber;

    //BRAND-MODEL MANAGEMENT
    @FXML
    private StackPane brandModelManagementView;
    @FXML
    private TextField addBrandModelBrandField;
    @FXML
    private TextField addBrandModelModelField;
    @FXML
    private Button addBrandModelButton;
    @FXML
    private Button removeBrandModelButton;
    @FXML
    private TableView<BrandModel> brandModelTable;
    @FXML
    private TableColumn<BrandModel, String> brandModelTableBrand;
    @FXML
    private TableColumn<BrandModel, String> brandModelTableModel;
    @FXML
    private TableColumn<BrandModel, Boolean> brandModelTableInProduction;

    //CAR STORE MANAGEMENT
    @FXML
    private StackPane carStoreManagementView;
    @FXML
    private TextField addCarStoreCountryField;
    @FXML
    private TextField addCarStoreCityField;
    @FXML
    private TextField addCarStoreAddressField;
    @FXML
    private Button addCarStoreButton;
    @FXML
    private Button removeCarStoreButton;
    @FXML
    private TableView<CarStore> carStoreTable;
    @FXML
    private TableColumn<CarStore, String> carStoreTableCountry;
    @FXML
    private TableColumn<CarStore, String> carStoreTableCity;
    @FXML
    private TableColumn<CarStore, String> carStoreTableAddress;

    //DEALER ORDERS
    @FXML
    private StackPane dealerOrdersView;
    @FXML
    private TextField dealerOrderAmountField;
    @FXML
    private ChoiceBox<String> dealerOrderModelBox;
    @FXML
    private Button addOrderButton;
    @FXML
    private TableView<Order> dealerOrdersTable;
    @FXML
    private TableColumn<Order, String> dealerOrdersTableBrand;
    @FXML
    private TableColumn<Order, String> dealerOrdersTableModel;
    @FXML
    private TableColumn<Order, Integer> dealerOrdersTableAmount;

    public ClientController(Client client) {
        this.client = client;
    }

    @FXML
    void initialize() {
        accountTypeBox.getItems().add("Company");
        accountTypeBox.getItems().add("Factory");
        accountTypeBox.getItems().add("Dealer");
        accountTypeBox.getItems().add("Car Store");
        accountTypeBox.getItems().add("Company Worker");

        companyToolBox.getItems().add("Factories Management");
        companyToolBox.getItems().add("Factory-Model Management");
        companyToolBox.getItems().add("Dealer Management");
        companyToolBox.getItems().add("Brand-Model Management");

        dealerToolBox.getItems().add("Car Store Management");
        dealerToolBox.getItems().add("Orders");

        transactionTypeBox.getItems().add("Sale");
        transactionTypeBox.getItems().add("Leasing");
    }

    //LOGIN
    @FXML
    private void loginButtonOnClick(ActionEvent e) {
        loginErrorLabel.setText("");
        String login = loginField.getText();
        String password = passwordField.getText();
        String accountType = accountTypeBox.getValue();
        if(accountType != null) {
            if (client.connectToDatabase(login, password, accountType)) {
                logInAs(accountType);
            } else {
                loginErrorLabel.setText("Can't connect to database, check your login/password.");
            }
        }
        else {
            loginErrorLabel.setText("You have to choose your account type!");
        }
    }

    private void logInAs(String accountType) {
        loginErrorLabel.setText("");
        switch(accountType) {
            case("Company"):
                loginView.setVisible(false);
                loginView.setDisable(true);
                companyView.setVisible(true);
                companyView.setDisable(false);
                break;
            case("Factory"):
                loginView.setVisible(false);
                loginView.setDisable(true);
                initFactoryView();
                factoryView.setVisible(true);
                factoryView.setDisable(false);
                break;
            case("Dealer"):
                loginView.setVisible(false);
                loginView.setDisable(true);
                dealerView.setVisible(true);
                dealerView.setDisable(false);
                break;
            case("Car Store"):
                loginView.setVisible(false);
                loginView.setDisable(true);
                initCarStoreView();
                carStoreView.setVisible(true);
                carStoreView.setDisable(false);
                break;
            case("Company Worker"):
                loginView.setVisible(false);
                loginView.setDisable(true);
                initWorkerView();
                companyWorkerView.setVisible(true);
                companyWorkerView.setDisable(false);
                break;
            default:
                break;
        }
    }

    @FXML
    private void logoutButtonOnClick(ActionEvent e) {
        if(client.disconnect()) {
            Button source = (Button)e.getSource();
            StackPane currView = (StackPane)source.getParent();
            currView.setVisible(false);
            currView.setDisable(true);
            loginField.clear();
            passwordField.clear();
            loginView.setVisible(true);
            loginView.setDisable(false);
        }
    }

    //COMPANY
    @FXML
    private void companyOKButtonOnClick(ActionEvent e) {
        String tool = companyToolBox.getValue();
        if(tool != null) {
            companyView.setDisable(true);
            companyView.setVisible(false);
            switch (tool) {
                case ("Factories Management"):
                    initFactoryManagementView();
                    factoryManagementView.setDisable(false);
                    factoryManagementView.setVisible(true);
                    break;
                case("Factory-Model Management"):
                    initFactoryModelManagementView();
                    factoryModelManagementView.setVisible(true);
                    factoryModelManagementView.setDisable(false);
                    break;
                case("Dealer Management"):
                    initDealerManagementView();
                    dealerManagementView.setVisible(true);
                    dealerManagementView.setDisable(false);
                    break;
                case("Brand-Model Management"):
                    initBrandModelManagementView();
                    brandModelManagementView.setVisible(true);
                    brandModelManagementView.setDisable(false);
                    break;
                default:
                    break;
            }
        }
    }


    //FACTORY
    public void initFactoryView() {
        brandModelList = BrandModel.getBrandModels(client.connection);
        orderList = Order.getOrdersForFactory(client.connection, client.factoryId);
        factoryOrdersTableBrand.setCellValueFactory(new PropertyValueFactory<>("brand"));
        factoryOrdersTableModel.setCellValueFactory(new PropertyValueFactory<>("model"));
        factoryOrdersTableAmount.setCellValueFactory(new PropertyValueFactory<>("amount"));
        factoryOrdersTableAccomplished.setCellValueFactory(new PropertyValueFactory<>("accomplished"));
        factoryOrdersTable.setItems(orderList);
    }

    @FXML
    private void setOrderStateButtonOnClick(ActionEvent e) {
        Order orderToSet = factoryOrdersTable.getSelectionModel().getSelectedItem();
        if(orderToSet != null) {
            if(Order.setAsAccomplished(client.connection, orderToSet)) {
                orderList.remove(orderToSet);
                factoryOrdersTable.setItems(orderList);
                //TODO - print message
            }
            else {
                //TODO - print error
            }
        }
        else {
            //TODO - print error
        }
    }

    //DEALER
    @FXML
    private void dealerOKButtonOnClick(ActionEvent e) {
        String tool = dealerToolBox.getValue();
        if(tool != null) {
            dealerView.setDisable(true);
            dealerView.setVisible(false);
            switch(tool) {
                case("Car Store Management"):
                    initCarStoreManagementView();
                    carStoreManagementView.setVisible(true);
                    carStoreManagementView.setDisable(false);
                    break;
                case("Orders"):
                    initDealerOrdersView();
                    dealerOrdersView.setVisible(true);
                    dealerOrdersView.setDisable(false);
                    break;
                default:
                    break;
            }
        }
    }

    //CAR STORE
    private void initCarStoreView() {
        brandModelList = BrandModel.getBrandModels(client.connection);
        ObservableList<String> models = FXCollections.observableArrayList();
        for(BrandModel bM: brandModelList) {
            models.add(bM.getBrand()+"/"+bM.getModel());
        }
        transactionModelBox.setItems(models);
    }

    @FXML
    private void addTransactionButtonOnClick(ActionEvent e) {
        transactionInfoLabel.setText("");
        String model = transactionModelBox.getValue();
        String type = transactionTypeBox.getValue().toLowerCase();
        String[] brandModel = model.split("/");
        if(model != null && type != null) {
            if(Transaction.addTransaction(client.connection, client.carStoreId, brandModel[0], brandModel[1], type)) {
                transactionInfoLabel.setText("Transaction added");
            }
        }
        else {
            transactionInfoLabel.setText("Pick model and transaction type");
        }
    }

    //COMPANY WORKER
    private void initWorkerView() {
        orderForWorkerList = OrderForWorker.getOrdersForWorker(client.connection);

        workerOrdersTableBrand.setCellValueFactory(new PropertyValueFactory<>("brand"));
        workerOrdersTableModel.setCellValueFactory(new PropertyValueFactory<>("model"));
        workerOrdersTableAmount.setCellValueFactory(new PropertyValueFactory<>("amount"));
        workerOrdersTableCountry.setCellValueFactory(new PropertyValueFactory<>("dealerCountry"));
        workerOrdersTableCity.setCellValueFactory(new PropertyValueFactory<>("dealerCity"));
        workerOrdersTable.setItems(orderForWorkerList);

        factoryList.clear();
        workerFactoryTableCountry.setCellValueFactory(new PropertyValueFactory<>("country"));
        workerFactoryTableCity.setCellValueFactory(new PropertyValueFactory<>("city"));
        workerFactoryTableAddress.setCellValueFactory(new PropertyValueFactory<>("address"));
        workerFactoryTableNumber.setCellValueFactory(new PropertyValueFactory<>("number"));
        workerFactoryTable.setItems(factoryList);
    }

    @FXML
    private void signToFactoryButtonOnClick(ActionEvent e) {
        OrderForWorker order = workerOrdersTable.getSelectionModel().getSelectedItem();
        Factory factory = workerFactoryTable.getSelectionModel().getSelectedItem();
        if(OrderForWorker.signFactoryToOrder(client.connection, factory, order)) {
            orderForWorkerList.remove(order);
            workerOrdersTable.setItems(orderForWorkerList);
            factoryList.clear();
            workerFactoryTable.setItems(factoryList);
        }
    }

    @FXML
    private void showFactoriesButtonOnClick(ActionEvent e) {
        OrderForWorker order = workerOrdersTable.getSelectionModel().getSelectedItem();
        factoryList = Factory.showFactoriesForOrder(client.connection, order);
        workerFactoryTable.setItems(factoryList);
    }

    //FACTORY MANAGEMENT
    private void initFactoryManagementView() {
        factoriesTableID.setCellValueFactory(new PropertyValueFactory<>("id"));
        factoriesTableCountry.setCellValueFactory(new PropertyValueFactory<>("country"));
        factoriesTableCity.setCellValueFactory(new PropertyValueFactory<>("city"));
        factoriesTableAddress.setCellValueFactory(new PropertyValueFactory<>("address"));
        factoriesTableNumber.setCellValueFactory(new PropertyValueFactory<>("number"));
        factoryList = Factory.getFactories(client.connection);
        factoriesTable.setItems(factoryList);
    }

    @FXML
    private void addFactoryButtonOnClick(ActionEvent e) {
        String country = newFactoryCountryField.getText();
        String city = newFactoryCityField.getText();
        String address = newFactoryAddressField.getText();
        String number = newFactoryNumberField.getText();
        if(country != null && city != null && address != null && number != null) {
            if (Factory.addFactory(client.connection, country, city, address, number)) {
                factoryList.clear();
                factoryList = Factory.getFactories(client.connection);
                factoriesTable.setItems(factoryList);
                //TODO - print message
            } else {
                //TODO - print error
            }
        }
        else {
            //TODO - print error
        }
    }

    @FXML
    private void deleteFactoryButtonOnClick(ActionEvent e) {
        Factory factoryToDelete = factoriesTable.getSelectionModel().getSelectedItem();
        if(factoryToDelete != null) {
            if(Factory.deleteFactory(client.connection, factoryToDelete)) {
                factoryList.remove(factoryToDelete);
                factoriesTable.setItems(factoryList);
                //TODO - print message
            }
            else {
                //TODO - print error
            }
        }
        else {
            //TODO - print error
        }
    }

    //FACTORY-MODEL MANAGEMENT
    public void initFactoryModelManagementView() {
//        brandModelList.clear();
//        factoryList.clear();
        factoryModelList = FactoryModel.getAll(client.connection);
        brandModelList = BrandModel.getBrandModels(client.connection);
        factoryList = Factory.getFactories(client.connection);

        ObservableList<String> factories = FXCollections.observableArrayList();
        ObservableList<String> models = FXCollections.observableArrayList();

        for(Factory f: factoryList) {
            factories.add(String.valueOf(f.getId()));
        }
        factoryModelBoxFactory.setItems(factories);
        for(BrandModel bM: brandModelList) {
            models.add(bM.getBrand()+"/"+bM.getModel());
        }
        factoryModelBoxModel.setItems(models);

        factoryModelTableFactory.setCellValueFactory(new PropertyValueFactory<>("factoryProperties"));
        factoryModelTableModel.setCellValueFactory(new PropertyValueFactory<>("brandModel"));
        factoryModelTable.setItems(factoryModelList);
    }

    @FXML
    private void signModelToFactoryButtonOnClick(ActionEvent e) {
        String factory = factoryModelBoxFactory.getValue();
        String model = factoryModelBoxModel.getValue();
        if(factory != null && model != null) {
            Factory choosenFactory = null;
            BrandModel choosenModel = null;
            for(Factory f: factoryList) {
                if(String.valueOf(f.getId()).equals(factory)) {
                    choosenFactory = f;
                    break;
                }
            }
            for(BrandModel bM: brandModelList) {
                if(model.equals(bM.getBrand() + "/" + bM.getModel())) {
                    choosenModel = bM;
                    break;
                }
            }
            if(FactoryModel.addFactoryModel(client.connection, choosenFactory.getId(), choosenModel.getId())) {
                factoryModelList = FactoryModel.getAll(client.connection);
            }
        }
    }

    @FXML
    private void removeModelFromFactoryButtonOnClick(ActionEvent e) {
        FactoryModel factoryModelToDelete = factoryModelTable.getSelectionModel().getSelectedItem();
        if(factoryModelToDelete != null) {
            if(FactoryModel.deleteFactoryModel(client.connection, factoryModelToDelete)) {
                factoryModelList.remove(factoryModelToDelete);
                factoryModelTable.setItems(factoryModelList);
                //TODO - print message
            }
            else {
                //TODO - print error
            }
        }
        else {
            //TODO - print error
        }
    }

    @FXML
    private void showButtonOnClick(ActionEvent e) {
        showAvailableModels();
    }

    @FXML
    private void showAll(ActionEvent e) {
        factoryModelList = FactoryModel.getAll(client.connection);
        factoryModelTable.setItems(factoryModelList);
    }

    //show models for chosen factory and brandModel
    private void showAvailableModels() {
        String factory = factoryModelBoxFactory.getValue();
        String model = factoryModelBoxModel.getValue();
        if(model == null && factory != null) {
            Factory choosenFactory = null;
            for (Factory f : factoryList) {
                if (String.valueOf(f.getId()).equals(factory)) {
                    choosenFactory = f;
                    break;
                }
            }
            factoryModelList = FactoryModel.getFactoryModelList(client.connection, choosenFactory);
            factoryModelTable.setItems(factoryModelList);
        }
        else if(model != null && factory == null) {
            BrandModel choosenModel = null;
            for(BrandModel bM: brandModelList) {
                if(model.equals(bM.getBrand() + "/" + bM.getModel())) {
                    choosenModel = bM;
                    break;
                }
            }
            factoryModelList = FactoryModel.getFactoryModelList(client.connection, choosenModel);
            factoryModelTable.setItems(factoryModelList);
        }
        else if(model != null && factory != null) {
            BrandModel choosenModel = null;
            Factory choosenFactory = null;
            for(BrandModel bM: brandModelList) {
                if(model.equals(bM.getBrand() + "/" + bM.getModel())) {
                    choosenModel = bM;
                    break;
                }
            }
            for (Factory f : factoryList) {
                if (String.valueOf(f.getId()).equals(factory)) {
                    choosenFactory = f;
                    break;
                }
            }
            factoryModelList = FactoryModel.getFactoryModelList(client.connection, choosenModel, choosenFactory);
            factoryModelTable.setItems(factoryModelList);
        }
    }

    //DEALER MANAGEMENT
    private void initDealerManagementView() {
        dealersList.clear();
        dealersList = Dealer.getDealers(client.connection);
        dealersTableId.setCellValueFactory(new PropertyValueFactory<>("id"));
        dealersTableCountry.setCellValueFactory(new PropertyValueFactory<>("country"));
        dealersTableCity.setCellValueFactory(new PropertyValueFactory<>("city"));
        dealersTableAddress.setCellValueFactory(new PropertyValueFactory<>("address"));
        dealersTableNumber.setCellValueFactory(new PropertyValueFactory<>("number"));
        dealersTable.setItems(dealersList);

    }

    @FXML
    private void removeDealerButtonOnClick(ActionEvent e) {
        Dealer dealerToDelete = dealersTable.getSelectionModel().getSelectedItem();
        if(dealerToDelete != null) {
            if(Dealer.deleteDealer(client.connection, dealerToDelete)) {
                dealersList.remove(dealerToDelete);
                dealersTable.setItems(dealersList);
                //TODO - print message
            }
            else {
                //TODO - print error
            }
        }
        else {
            //TODO - print error
        }
    }

    @FXML
    private void addDealerButtonOnClick(ActionEvent e) {
        String id = addDealerIdField.getText();
        String country = addDealerCountryField.getText();
        String city = addDealerCityField.getText();
        String address = addDealerAddressField.getText();
        String number = addDealerNumberField.getText();
        if(id != null && country != null && city != null && address != null && number != null) {
            if(Dealer.addDealer(client.connection, id, country, city, address, number)) {
                dealersList.add(new Dealer(id, country, city, address, Integer.parseInt(number)));
            }
            else {
                //error
            }
        }
        else {
            //error
        }
    }

    //BRAND-MODEL MANAGEMENT
    private void initBrandModelManagementView() {
        brandModelList.clear();
        brandModelList = BrandModel.getBrandModels(client.connection);
        brandModelTableBrand.setCellValueFactory(new PropertyValueFactory<>("brand"));
        brandModelTableModel.setCellValueFactory(new PropertyValueFactory<>("model"));
        brandModelTableInProduction.setCellValueFactory(new PropertyValueFactory<>("inProduction"));
        brandModelTable.setItems(brandModelList);
    }
    @FXML
    private void removeBrandModelButtonOnClick(ActionEvent e) {
        BrandModel brandModelToDelete = brandModelTable.getSelectionModel().getSelectedItem();
        if(brandModelToDelete != null) {
            if(BrandModel.deleteBrandModel(client.connection, brandModelToDelete)) {
                brandModelList = BrandModel.getBrandModels(client.connection);
                brandModelTable.setItems(brandModelList);
                //TODO - print message
            }
            else {
                //TODO - print error
            }
        }
        else {
            //TODO - print error
        }
    }

    @FXML
    private void addBrandModelButtonOnClick(ActionEvent e) {
        String brand = addBrandModelBrandField.getText();
        String model = addBrandModelModelField.getText();
        if(brand != null && model != null) {
            if(BrandModel.addBrandModel(client.connection, brand, model)) {
                brandModelList.add(new BrandModel(0, brand, model, false));
                brandModelTable.setItems(brandModelList);
                //message
            }
            else {
                //error
            }
        }
        else {
            //error
        }
    }

    //CAR STORE MANAGEMENT
    public void initCarStoreManagementView() {
        carStoreList = CarStore.getCarStoreList(client.connection, client.dealerId);
        carStoreTableCountry.setCellValueFactory(new PropertyValueFactory<>("country"));
        carStoreTableCity.setCellValueFactory(new PropertyValueFactory<>("city"));
        carStoreTableAddress.setCellValueFactory(new PropertyValueFactory<>("address"));
        carStoreTable.setItems(carStoreList);
    }

    @FXML
    private void addCarStoreButtonOnClick(ActionEvent e) {
        String country = addCarStoreCountryField.getText();
        String city = addCarStoreCityField.getText();
        String address = addCarStoreAddressField.getText();
        if(country != null && city != null && address != null) {
            if(CarStore.addCarStore(client.connection, client.dealerId, country, city, address)) {
                carStoreList = CarStore.getCarStoreList(client.connection, client.dealerId);
                carStoreTable.setItems(carStoreList);
                //message
            }
            else {
                //error
            }
        }
        else {
            //error
        }
    }

    @FXML
    private void removeCarStoreButtonOnClick(ActionEvent e) {
        CarStore carStoreToDelete = carStoreTable.getSelectionModel().getSelectedItem();
        if(carStoreToDelete != null) {
            if(CarStore.deleteCarStore(client.connection, carStoreToDelete)) {
                carStoreList = CarStore.getCarStoreList(client.connection, client.dealerId);
                carStoreTable.setItems(carStoreList);
                //TODO - print message
            }
            else {
                //TODO - print error
            }
        }
        else {
            //TODO - print error
        }
    }

    //DEALER ORDERS
    private void initDealerOrdersView() {
        orderList = Order.getOrdersForDealer(client.connection, client.dealerId);
        brandModelList = BrandModel.getBrandModels(client.connection);
        ObservableList<String> models = FXCollections.observableArrayList();

        for(BrandModel bM: brandModelList) {
            models.add(bM.getBrand()+"/"+bM.getModel());
        }
        dealerOrderModelBox.setItems(models);

        dealerOrdersTableBrand.setCellValueFactory(new PropertyValueFactory<>("brand"));
        dealerOrdersTableModel.setCellValueFactory(new PropertyValueFactory<>("model"));
        dealerOrdersTableAmount.setCellValueFactory(new PropertyValueFactory<>("amount"));
        dealerOrdersTable.setItems(orderList);
    }
    @FXML
    private void addOrderButtonOnClick(ActionEvent e) {
        String brandModel = dealerOrderModelBox.getValue();
        if(brandModel != null) {
            String[] model = brandModel.split("/");
            String amount = dealerOrderAmountField.getText();
            if (model[0] != null && model[1] != null && amount != null) {
                if (Order.addOrder(client.connection, client.dealerId, model[0], model[1], amount)) {
                    orderList = Order.getOrdersForDealer(client.connection, client.dealerId);
                    dealerOrdersTable.setItems(orderList);
                } else {
                    //error
                }
            } else {
                //error
            }
        }
    }
}
