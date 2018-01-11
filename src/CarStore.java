public class CarStore {
    String id;
    String country;
    String city;
    String address;

    public CarStore(String id, String country, String city, String address) {
        this.id = id;
        this.country = country;
        this.city = city;
        this.address = address;
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

    public static boolean addCarStore(String country, String city, String address) {
        return true;
    }
}
