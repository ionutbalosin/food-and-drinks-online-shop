package org.ib.spring.serviceprovider;

public class Pizza {
    private String name, price;

    @Override
    public String toString() {
        return "Pizza{" +
                ", name='" + name + '\'' +
                ", price='" + price + '\'' +
                '}';
    }

    public Pizza(String name, String price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
