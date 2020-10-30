package com.example.silen.takeawaysystem;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Typeface;
import android.support.design.widget.TabLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class OrderPage extends AppCompatActivity implements RecommendedAdapter.onRecommendedMenuListener {
    TableLayout tableLayout;
    Button btnPlaceOrder;
    String customer_id="";
    ArrayList<CartItem> foodItems;
    Intent intent;
    ArrayList<FoodItem> list;
    RecommendedAdapter adapter;
    RecyclerView recyclerView;
    TextView txtCountDialog;
    Button btnAddToCart;
    Button btnRemoveCart;
    TextView txtError;
    ImageView imgError;
    ScrollView scrollView;
    ImageButton btnCloseCart;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_page);
        btnPlaceOrder=findViewById(R.id.btnPlaceOrder);
        tableLayout=findViewById(R.id.tableOrder);
        customer_id=getIntent().getStringExtra("customer_id");
        foodItems=new ArrayList<>();
        getCart(customer_id);
        intent=new Intent();
        list=new ArrayList<>();
        recyclerView=findViewById(R.id.recycleRecommended);
        getMenu();
        txtError=findViewById(R.id.txtErrorOrder);
        imgError=findViewById(R.id.imgErrorRecommended);
        scrollView=findViewById(R.id.scrollReceipt);
        btnCloseCart=findViewById(R.id.btnCloseCart);
        btnCloseCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                setResult(RESULT_CANCELED,intent);
                finish();
            }
        });
        btnPlaceOrder.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                placeOrder(customer_id);
            }
        });
    }
    private void setupTable(){
        double total=0;
        double price=0;
        TableRow tableRowTitle=new TableRow(this);
        tableRowTitle.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.MATCH_PARENT, TableRow.LayoutParams.MATCH_PARENT));
        TextView txtTitleName=new TextView(this);
        txtTitleName.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.MATCH_PARENT,TableLayout.LayoutParams.WRAP_CONTENT));
        txtTitleName.setGravity(Gravity.LEFT);
        txtTitleName.setTypeface(Typeface.DEFAULT_BOLD);
        txtTitleName.setTextSize(16);
        txtTitleName.setTextColor(getResources().getColor(R.color.black));
        txtTitleName.setText("Item Name");
        TextView txtTitleQuantity=new TextView(this);
        txtTitleQuantity.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.MATCH_PARENT,TableLayout.LayoutParams.WRAP_CONTENT));
        txtTitleQuantity.setGravity(Gravity.RIGHT);
        txtTitleQuantity.setTypeface(Typeface.DEFAULT_BOLD);
        txtTitleQuantity.setTextSize(16);
        txtTitleQuantity.setTextColor(getResources().getColor(R.color.black));
        txtTitleQuantity.setText("Quantity");
        TextView txtTitlePrice=new TextView(this);
        txtTitlePrice.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.MATCH_PARENT,TableLayout.LayoutParams.WRAP_CONTENT));
        txtTitlePrice.setGravity(Gravity.RIGHT);
        txtTitlePrice.setTypeface(Typeface.DEFAULT_BOLD);
        txtTitlePrice.setTextSize(16);
        txtTitlePrice.setTextColor(getResources().getColor(R.color.black));
        txtTitlePrice.setText("Price (RM)");
        tableRowTitle.addView(txtTitleName);
        tableRowTitle.addView(txtTitleQuantity);
        tableRowTitle.addView(txtTitlePrice);
        tableLayout.addView(tableRowTitle);
        for(int i=0;i<foodItems.size();i++){
            TableRow tableRow=new TableRow(this);
            tableRow.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.MATCH_PARENT, TableRow.LayoutParams.MATCH_PARENT));
            tableRow.setPadding(0,0,0,10);
            TextView txtName=new TextView(this);
            txtName.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
            txtName.setGravity(Gravity.LEFT);
            txtName.setTextSize(15);
            txtName.setTextColor(getResources().getColor(R.color.black));
            txtName.setText(foodItems.get(i).getName());
            TextView txtQuantity=new TextView(this);
            txtQuantity.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
            txtQuantity.setGravity(Gravity.RIGHT);
            txtQuantity.setTextSize(15);
            txtQuantity.setTextColor(getResources().getColor(R.color.black));
            txtQuantity.setText(foodItems.get(i).getQuantity()+"");
            TextView txtPrice=new TextView(this);
            txtPrice.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
            txtPrice.setGravity(Gravity.RIGHT);
            txtPrice.setTextSize(15);
            txtPrice.setTextColor(getResources().getColor(R.color.black));
            price=foodItems.get(i).getPrice()*foodItems.get(i).getQuantity();
            total+=price;
            txtPrice.setText(String.format("%.2f",price));
            tableRow.addView(txtName);
            tableRow.addView(txtQuantity);
            tableRow.addView(txtPrice);
            tableLayout.addView(tableRow);

        }
        TableRow totalPriceRow=new TableRow(this);
        totalPriceRow.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.MATCH_PARENT, TableRow.LayoutParams.MATCH_PARENT));
        totalPriceRow.setBackground(getResources().getDrawable(R.drawable.tablestyle));
        totalPriceRow.setPadding(0,10,0,0);
        TextView txtSpan1=new TextView(this);
        TextView txtSpan2=new TextView(this);
        txtSpan1.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
        txtSpan2.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
        txtSpan2.setGravity(Gravity.RIGHT);
        txtSpan2.setTypeface(Typeface.DEFAULT_BOLD);
        txtSpan2.setTextColor(getResources().getColor(R.color.black));
        txtSpan2.setTextSize(16);
        txtSpan2.setText("Total Price :");
        TextView txtTotal=new TextView(this);
        txtTotal.setGravity(Gravity.RIGHT);
        txtTotal.setTextSize(15);
        txtTotal.setTextColor(getResources().getColor(R.color.black));
        txtTotal.setText(String.format("%.2f",total));

        txtTotal.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
        totalPriceRow.addView(txtSpan1);
        totalPriceRow.addView(txtSpan2);
        totalPriceRow.addView(txtTotal);
        tableLayout.addView(totalPriceRow);

    }
    public void getMenu(){
        try{
            RequestQueue queue=Volley.newRequestQueue(this);
            StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.GETMENU, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    String url="";
                    try{
                        JSONObject object=new JSONObject(response);
                        Log.d("response",response);
                        JSONArray menu=object.getJSONArray("food");
                        JSONObject temp;
                        if(object.getString("menu").equals("success")){
                            for(int i=0;i<menu.length();i++){
                                temp=menu.getJSONObject(i);
                                url=Api.API_IMAGE_ROOT+temp.getString("image");

                                list.add(new FoodItem(temp.getString("model"),temp.getString("name"),temp.getDouble("price"),url,temp.getInt("product_id")));
                            }
                            JSONArray count=object.getJSONArray("counter");
                            int total=0;
                            Log.d("countLength",count.length()+"");

                            LinearLayoutManager layoutManager=new LinearLayoutManager(OrderPage.this,LinearLayoutManager.HORIZONTAL,false);
                            adapter=new RecommendedAdapter(list,OrderPage.this,OrderPage.this);
                            recyclerView.setLayoutManager(layoutManager);
                            recyclerView.setAdapter(adapter);
                        }
                        else{
                            //empty case
                        }
                    }
                    catch(Throwable t){
                        t.printStackTrace();
                    }
                    Log.d("size",foodItems.size()+"");
                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Log.e("CANT connect","error");
                }
            });
            queue.add(stringRequest);
        }
        catch(Throwable t){
            Log.e("ERROR",t.getMessage());
        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        setResult(RESULT_CANCELED,intent);
    }

    private void getCart(final String customer_id){
        RequestQueue queue= Volley.newRequestQueue(this);
        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.GETCART, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject object=new JSONObject(response);
                    Log.d("response2",response);
                    if(object.getString("getCart").equals("success")){
                        JSONArray cartItems=object.getJSONArray("cart");
                        JSONObject cartItem;
                        for(int i=0;i<cartItems.length();i++){
                            cartItem=cartItems.getJSONObject(i);
                            foodItems.add(new CartItem(cartItem.getString("model"),cartItem.getDouble("price"),cartItem.getInt("quantity")));
                        }
                        setupTable();
                    }
                    else{
                        Toast.makeText(OrderPage.this, object.getString("error"), Toast.LENGTH_SHORT).show();
                    }
                }
                catch (Throwable t){
                    t.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("ERRORORDER","ERROR");
            }
        }){
            @Override
            protected Map<String,String> getParams(){
                HashMap<String,String> hashMap=new HashMap<>();
                hashMap.put("customer_id",customer_id);
                return hashMap;
            }
        };
        queue.add(stringRequest);
    }

    @Override
    public void onRecommendedMenuClick(int position, FoodItem foodItem) {
        alertDialog(foodItem,position);
    }
    public void alertDialog(final FoodItem foodItem, final int position){
        final Dialog dialog=new Dialog(this,R.style.CustomAlertDialog);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.custom_dialog);
        TextView txtDialogName=dialog.findViewById(R.id.txtDialogFoodName);
        txtDialogName.setText(foodItem.getName());
        ImageButton btnClose=dialog.findViewById(R.id.btnClose);
        ImageButton btnPlus=dialog.findViewById(R.id.btnPlus);
        final ImageButton btnMinus=dialog.findViewById(R.id.btnMinus);
        txtCountDialog=dialog.findViewById(R.id.txtCountDialog);
        for(int i=0;i<foodItems.size();i++){
            if(foodItem.getName().equals(foodItems.get(i).getName())){

                txtCountDialog.setText(foodItems.get(i).getQuantity()+"");
                break;
            }
        }
        btnAddToCart=dialog.findViewById(R.id.btnAddToCart);
        btnRemoveCart=dialog.findViewById(R.id.btnRemoveCart);
        final int tempCount=Integer.parseInt(txtCountDialog.getText()+"");
        dialog.setCancelable(true);
        dialog.show();
        if(Integer.parseInt(txtCountDialog.getText()+"")==0){
            btnMinus.setEnabled(false);
            btnAddToCart.setEnabled(false);
        }
        btnClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                txtCountDialog.setText(tempCount+"");
                dialog.dismiss();
            }
        });
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(DialogInterface dialogInterface) {
                txtCountDialog.setText(tempCount+"");
            }
        });
        btnMinus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String temp=(Integer.parseInt(txtCountDialog.getText()+"")-1)+"";
                txtCountDialog.setText(temp);
                if(Integer.parseInt(txtCountDialog.getText()+"")==0){
                    btnMinus.setEnabled(false);
                    btnAddToCart.setVisibility(View.GONE);
                    btnRemoveCart.setVisibility(View.VISIBLE);
                }
            }
        });
        btnPlus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String temp=(Integer.parseInt(txtCountDialog.getText()+"")+1)+"";
                txtCountDialog.setText(temp);
                if(Integer.parseInt(txtCountDialog.getText()+"")>0){
                    btnMinus.setEnabled(true);
                    btnAddToCart.setEnabled(true);
                    btnAddToCart.setVisibility(View.VISIBLE);
                    btnRemoveCart.setVisibility(View.GONE);
                }
            }
        });
        btnAddToCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                addToCart(customer_id,foodItem.getProduct_id(),Integer.parseInt(txtCountDialog.getText()+""),position,foodItem);
                dialog.dismiss();
            }
        });
        btnRemoveCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                removeCart(customer_id,foodItem.getProduct_id(),position,foodItem);
                dialog.dismiss();
            }
        });
    }
    public void addToCart(final String customer_id, final int product_id, final int quantity,final int position,final FoodItem foodItem){
        RequestQueue queue=Volley.newRequestQueue(this);
        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.ADDCART, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject object=new JSONObject(response);
                    if(object.getString("addCart").equals("success")){
                        boolean found=false;
                        for(int i=0;i<foodItems.size();i++){
                            if(foodItem.getName().equals(foodItems.get(i).getName())){
                                foodItems.get(i).setQuantity(Integer.parseInt(quantity+""));
                                found=true;
                            }
                        }
                        if(found==false){
                            foodItems.add(new CartItem(foodItem.getName(),foodItem.getPrice(),quantity));
                        }
                        if(imgError.getVisibility()==View.VISIBLE){
                            imgError.setVisibility(View.GONE);
                            txtError.setVisibility(View.GONE);
                            scrollView.setVisibility(View.VISIBLE);
                            btnPlaceOrder.setEnabled(true);
                        }
                        tableLayout.removeAllViews();
                        setupTable();
                    }
                    else{
                        Toast.makeText(OrderPage.this, "Failed to add to cart!", Toast.LENGTH_SHORT).show();
                    }
                }
                catch(Throwable t){
                    Log.d("errorAdd",t.getMessage());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(OrderPage.this, "Failed to add to cart! Check your internet connection!", Toast.LENGTH_SHORT).show();
            }
        }){
            protected Map<String,String> getParams(){
                HashMap<String,String> hashMap=new HashMap<>();
                hashMap.put("customer_id",customer_id+"");
                hashMap.put("product_id",product_id+"");
                hashMap.put("quantity",quantity+"");
                return hashMap;
            }
        };
        queue.add(stringRequest);
    }
    public void removeCart(final String customer_id, final int product_id,final int position,final FoodItem foodItem){
        RequestQueue queue=Volley.newRequestQueue(this);
        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.REMOVECART, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject object=new JSONObject(response);
                    if(object.getString("removeCart").equals("success")){
                        for(int i=0;i<foodItems.size();i++){
                            if(foodItem.getName().equals(foodItems.get(i).getName())) {
                                foodItems.remove(i);

                            }
                        }
                        if(foodItems.size()==0){
                            scrollView.setVisibility(View.GONE);
                            imgError.setVisibility(View.VISIBLE);
                            txtError.setVisibility(View.VISIBLE);
                            btnPlaceOrder.setEnabled(false);
                        }
                        tableLayout.removeAllViews();
                        setupTable();
                    }
                }
                catch(Throwable t){
                    Toast.makeText(OrderPage.this, "Failed to add to cart!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(OrderPage.this, "Failed to remove from cart! Check your internet connection!", Toast.LENGTH_SHORT).show();
            }
        }){protected Map<String,String> getParams(){
            HashMap<String,String> hashMap=new HashMap<>();
            hashMap.put("customer_id",customer_id+"");
            hashMap.put("product_id",product_id+"");
            return hashMap;
        }};
        queue.add(stringRequest);
    }
    public void placeOrder(final String customer_id) {
        RequestQueue queue = Volley.newRequestQueue(this);
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Api.PLACEORDER, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject object = new JSONObject(response);
                    if (object.getString("placeOrder").equals("success")) {
                        setResult(RESULT_OK, intent);
                        finish();
                    }
                } catch (Throwable t) {

                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }) {
            protected Map<String, String> getParams() {
                HashMap<String, String> hashMap = new HashMap<>();
                hashMap.put("customer_id", customer_id);
                return hashMap;
            }
        };

        queue.add(stringRequest);
    }
}
