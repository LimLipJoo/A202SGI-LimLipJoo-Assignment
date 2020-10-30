package com.example.silen.takeawaysystem;

public class Api {
    public static String API_ROOT="http://192.168.0.137/Takeaway_System/index.php?route=api/takeawayapi/";
    public static String API_IMAGE_ROOT="http://192.168.0.137/Takeaway_System/image/";
    public static String LOGIN=API_ROOT+"login";
    public static String REGISTER=API_ROOT+"register";
    public static String GETBANNER=API_ROOT+"getBanner";
    public static String GETMENU=API_ROOT+"getMenu";
    public static String GETCART=API_ROOT+"getCart";
    public static String ADDCART=API_ROOT+"addCart";
    public static String REMOVECART=API_ROOT+"removeCart";
    public static String PLACEORDER=API_ROOT+"placeOrder";
    public static String ORDERHISTORY=API_ROOT+"getOrderHistory";
    public static String GETORDERDETAILS=API_ROOT+"getOrderDetails";
}
