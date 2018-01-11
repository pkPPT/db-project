import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.StackPane;

import java.util.ArrayList;


public class ClientController {
    Client client;
    ArrayList<BrandModel> brandModelList = new ArrayList<>();
    ArrayList<Factory> factoryList = new ArrayList<>();

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


    //FACTORY MANAGEMENT
    @FXML
    private StackPane factoryManagementView;
    @FXML
    private TableView<Factory> factoriesTable;
    @FXML
    private TableColumn<Factory, String> factoriesTableID;
    @FXML
    private TableColumn<Factory, String> factoriesTableCountry;
    @FXML
    private TableColumn<Factory, String> factoriesTableCity;
    @FXML
    private TableColumn<Factory, String> factoriesTableAddress;
    @FXML
    private  TableColumn<Factory, String> factoriesTableNumber;
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
    //TODO - table with factories and signed models

    //DEALER MANAGEMENT
    @FXML
    private StackPane dealerManagementView;
    @FXML
    private Button removeDealerButton;
    @FXML
    private Button addDealerButton;
    @FXML
    private TextField addDealerCountryField;
    @FXML
    private TextField addDealerCityField;
    @FXML
    private TextField addDealerAddressField;
    @FXML
    private TextField addDealerNumberField;
    //TODO - table with dealers

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
    //TODO - table with cars

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
    //TODO - table with car stores

    //DEALER ORDERS
    @FXML
    private StackPane dealerOrdersView;
    @FXML
    private TextField dealerOrderAmountField;
    @FXML
    private ChoiceBox<String> dealerOrderModelBox;
    @FXML
    private Button addOrderButton;

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
                //error
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
                companyWorkerView.setVisible(true);
                companyWorkerView.setDisable(false);
                break;
            default:
                break;
        }
    }

    private void initCarStoreView() {
        //ustawianie choiceboxow
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
                    dealerManagementView.setVisible(true);
                    dealerManagementView.setDisable(false);
                    break;
                case("Brand-Model Management"):
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
        factoryOrdersTableBrand.setCellValueFactory(new PropertyValueFactory<>("brand"));
        factoryOrdersTableModel.setCellValueFactory(new PropertyValueFactory<>("model"));
        factoryOrdersTableAmount.setCellValueFactory(new PropertyValueFactory<>("amount"));
        factoryOrdersTableAccomplished.setCellValueFactory(new PropertyValueFactory<>("accomplished"));
        factoryOrdersTable.setItems(Order.getOrders());
    }

    @FXML
    private void setOrderStateButtonOnClick(ActionEvent e) {
        Order orderToSet = factoryOrdersTable.getSelectionModel().getSelectedItem();
        if(orderToSet != null) {
            if(Order.setAsAccomplished(orderToSet)) {
                ObservableList<Order> newList = factoryOrdersTable.getItems();
                newList.remove(orderToSet);
                factoryOrdersTable.setItems(newList);
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
                    carStoreManagementView.setVisible(true);
                    carStoreManagementView.setDisable(false);
                    break;
                case("Orders"):
                    dealerOrdersView.setVisible(true);
                    dealerOrdersView.setDisable(false);
                    break;
                default:
                    break;
            }
        }
    }

    //CAR STORE
    @FXML
    private void addTransactionButtonOnClick(ActionEvent e) {
        transactionInfoLabel.setText("");
        String model = transactionModelBox.getValue();
        String type = transactionTypeBox.getValue();
        if(model != null && type != null) {

        }
        else {
            transactionInfoLabel.setText("Pick model and transaction type");
        }
    }

    //COMPANY WORKER

    //FACTORY MANAGEMENT
    private void initFactoryManagementView() {
        factoriesTableID.setCellValueFactory(new PropertyValueFactory<>("id"));
        factoriesTableCountry.setCellValueFactory(new PropertyValueFactory<>("country"));
        factoriesTableCity.setCellValueFactory(new PropertyValueFactory<>("city"));
        factoriesTableAddress.setCellValueFactory(new PropertyValueFactory<>("address"));
        factoriesTableNumber.setCellValueFactory(new PropertyValueFactory<>("number"));
        factoriesTable.setItems(Factory.getFactories());
        //TODO - sciagniecie listy fabryk z bazy
    }

    @FXML
    private void addFactoryButtonOnClick(ActionEvent e) {
        String country = newFactoryCountryField.getText();
        String city = newFactoryCityField.getText();
        String address = newFactoryAddressField.getText();
        String number = newFactoryNumberField.getText();
        if(country != null && city != null && address != null && number != null) {
            if (Factory.addFactory(country, city, address, number)) {
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
            if(Factory.deleteFactory(factoryToDelete)) {
                ObservableList<Factory> newList = factoriesTable.getItems();
                newList.remove(factoryToDelete);
                factoriesTable.setItems(newList);
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
        brandModelList.clear();
        factoryList.clear();
        brandModelList = BrandModel.getBrandModels();
        factoryList = Factory.getFactoryList();

        ObservableList<String> brand = FXCollections.observableArrayList();
        ObservableList<String> factory = FXCollections.observableArrayList();
        for(BrandModel b : brandModelList) {
            brand.add(b.getBrand() + "/" + b.getModel());
        }
        for(Factory f : factoryList) {
            factory.add(f.getCountry() + "/" + f.getCity() + "/" + f.getAddress());
        }

        factoryModelBoxModel.setItems(brand);
        factoryModelBoxFactory.setItems(factory);
    }
    @FXML
    private void signModelToFactoryButtonOnClick(ActionEvent e) {
        //TODO
    }

    //DEALER MANAGEMENT
    @FXML
    private void removeDealerButtonOnClick(ActionEvent e) {

    }

    @FXML
    private void addDealerButtonOnClick(ActionEvent e) {
        String country = addDealerCountryField.getText();
        String city = addDealerCityField.getText();
        String address = addDealerAddressField.getText();
        String number = addDealerNumberField.getText();
        if(country != null && city != null && address != null && number != null) {
            if(Dealer.addDealer(country, city, address, number)) {
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

    //BRAND-MODEL MANAGEMENT
    @FXML
    private void removeBrandModelButtonOnClick(ActionEvent e) {

    }

    @FXML
    private void addBrandModelButtonOnClick(ActionEvent e) {
        String brand = addBrandModelBrandField.getText();
        String model = addBrandModelModelField.getText();
        if(brand != null && model != null) {
            if(BrandModel.addBrandModel(brand, model)) {
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
    @FXML
    private void addCarStoreButtonOnClick(ActionEvent e) {
        String country = addCarStoreCountryField.getText();
        String city = addCarStoreCityField.getText();
        String address = addCarStoreAddressField.getText();
        if(country != null && city != null && address != null) {
            if(CarStore.addCarStore(country, city, address)) {
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

    }

    //DEALER ORDERS
    @FXML
    private void addOrderButtonOnClick(ActionEvent e) {
        String brandModel = dealerOrderModelBox.getValue();
        if(brandModel != null) {
            String[] model = brandModel.split("/");
            String amount = dealerOrderAmountField.getText();
            if (model[0] != null && model[1] != null && amount != null) {
                if (Order.addOrder(model[0], model[1], amount)) {
                    //msg
                } else {
                    //error
                }
            } else {
                //error
            }
        }
    }
}
