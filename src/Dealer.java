public class Dealer {
    String id;
    String country;
    String city;
    String address;
    String number;

    public Dealer(String id, String country, String city, String address, String number) {
        this.id = id;
        this.country = country;
        this.city = city;
        this.address = address;
        this.number = number;
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

    public String getNumber() {
        return number;
    }

    public static boolean addDealer(String country, String city, String address, String number) {
        //TODO
        return true;
    }
}
