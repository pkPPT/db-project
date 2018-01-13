import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Transaction {
    Date date;
    int carStoreId;
    int brandModelId;
    char type;

    public Transaction(Date date, int carStoreId, int brandModelId, char type) {
        this.date = date;
        this.carStoreId = carStoreId;
        this.brandModelId = brandModelId;
        this.type = type;
    }

    public static boolean addTransaction(Connection connection, int carStoreId, String brand, String model, String type) {
        try {
            int idBrandModel;
            PreparedStatement stmt1 = connection.prepareStatement("SELECT id FROM Brand_Model WHERE brand = ? AND model = ?");
            stmt1.setString(1, brand);
            stmt1.setString(2, model);

            ResultSet rs1 = stmt1.executeQuery();
            rs1.next();
            idBrandModel = rs1.getInt("id");

//            PreparedStatement stmt2 = connection.prepareStatement("INSERT INTO Transaction(date, id_car_store, id_brand_model, type) " +
//                    "VALUES( ?, ?, ?, ?)");
            PreparedStatement stmt2 = connection.prepareStatement("CALL add_transaction(?, ?, ?)");

            stmt2.setInt(1, carStoreId);
            stmt2.setInt(2, idBrandModel);
            stmt2.setString(3, type);

            stmt2.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
