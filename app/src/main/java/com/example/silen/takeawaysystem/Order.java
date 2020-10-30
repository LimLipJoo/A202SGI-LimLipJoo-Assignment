package com.example.silen.takeawaysystem;

import java.util.Date;

public class Order {
    private int order_id;
    private String date;
    private double total;
    private String status;
    public Order(int order_id, String date, double total,String status) {
        this.order_id = order_id;
        this.date = date;
        this.total = total;
        this.status=status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
