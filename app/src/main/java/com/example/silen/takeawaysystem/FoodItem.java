package com.example.silen.takeawaysystem;

public class FoodItem {
    private String name;
    private String category;
    private double price;
    private String img;
    private int product_id;
    private int count;

    public FoodItem(String name, String category, double price, String img, int product_id) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.img = img;
        this.product_id = product_id;
        this.count=0;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
}
