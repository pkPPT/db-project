public class CarStore {
    int id; //PRIMARY KEY
    String dealerId;
    String country;
    String city;
    String address;

    public CarStore(int id, String dealerId, String country, String city, String address) {
        this.id = id;
        this.dealerId = dealerId;
        this.country = country;
        this.city = city;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public String getDealerId() {
        return dealerId;
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

    public static boolean addCarStore(String dealerId, String country, String city, String address) {
        return true;
    }
}
