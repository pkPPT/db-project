import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.StackPane;


public class ClientController {
    Client client;

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
    private ChoiceBox<String> factoryToolBox;
    @FXML
    private Button factoryOKButton;

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

        companyToolBox.getItems().add("");

        factoryToolBox.getItems().add("");

        dealerToolBox.getItems().add("");

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
    }


    //FACTORY
    @FXML
    private void factoryOKButtonOnClick(ActionEvent e) {
        String tool = factoryToolBox.getValue();
    }

    //DEALER
    @FXML
    private void dealerOKButtonOnClick(ActionEvent e) {
        String tool = dealerToolBox.getValue();
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

}
