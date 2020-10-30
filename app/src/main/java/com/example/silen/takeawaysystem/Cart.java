package com.example.silen.takeawaysystem;

import android.content.Context;
import android.util.Log;

import java.util.ArrayList;

public class Cart{
    private Context context;
    private ArrayList<CartItem> cartItems;
    private double totalPrice;
    private int totalItems;
    private int customer_id;
    public Cart(Context context,int customer_id) {
        this.context=context;
        this.customer_id=customer_id;
        cartItems=new ArrayList<>();
    }
    public boolean isEmpty(){
        return totalItems==0;
    }

    public ArrayList<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(ArrayList<CartItem> cartItems) {
        this.cartItems.clear();
        this.cartItems.addAll(cartItems);
        setTotalPrice();
        setTotalItems();
    }

    public double getTotalPrice() {
        return  totalPrice;
    }

    public void setTotalPrice() {
        double total=0;
        for (int i=0;i<cartItems.size();i++){
            total+=cartItems.get(i).getTotal();
        }
        totalPrice=total;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public void setTotalItems() {
        int total=0;
        for (int i=0;i<cartItems.size();i++){
            total+=cartItems.get(i).getQuantity();
        }
        totalItems=total;
    }
    public void removeCartItem(String name){
        for(int i=0;i<cartItems.size();i++){
            Log.d("name",name);
            Log.d("name2",cartItems.get(i).getName());
            if(cartItems.get(i).getName().equals(name)){
                Log.d("name3","hi");
                cartItems.remove(i);
                setTotalItems();
                setTotalPrice();
            }
        }
    }
    public void addCartItem(String name,double price,int quantity){
        boolean have=false;
        for(int i=0;i<cartItems.size();i++){
            if(cartItems.get(i).getName().equals(name)){
                cartItems.get(i).setQuantity(quantity);
                have=true;
            }
        }
        if(!have){
            cartItems.add(new CartItem(name,price,quantity));
        }
        setTotalItems();
        setTotalPrice();
    }


}
