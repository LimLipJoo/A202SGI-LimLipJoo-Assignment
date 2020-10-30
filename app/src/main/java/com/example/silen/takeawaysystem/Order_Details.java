package com.example.silen.takeawaysystem;

import android.content.Intent;
import android.graphics.Typeface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;

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

public class Order_Details extends AppCompatActivity {
    private String order_id;
    private ArrayList<CartItem> cartItems;
    private ImageView imgStatus;
    private String status="";
    private TableLayout tableLayout;
    private ImageButton btnCloseDetails;
    private TextView statusTxt;
    private TextView datePlaced;
    private String date;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order__details);
        order_id=getIntent().getStringExtra("order_id");
        imgStatus=findViewById(R.id.imgDetailsStatus);
        btnCloseDetails=findViewById(R.id.btnCloseDetails);
        status=getIntent().getStringExtra("status");
        tableLayout=findViewById(R.id.tableDetails);
        statusTxt=findViewById(R.id.txtStatusActual);
        date=getIntent().getStringExtra("date");
        datePlaced=findViewById(R.id.txtDateActual);
        datePlaced.setText(date);
        statusTxt.setText(status);
        if(status.equals("PROCESSING")){
            imgStatus.setImageResource(R.drawable.processing);
        }
        else if(status.equals("PREPARING")){
            imgStatus.setImageResource(R.drawable.preparing);
        }
        else if(status.equals("READY")){
            imgStatus.setImageResource(R.drawable.ready);
        }
        else{
            imgStatus.setImageResource(R.drawable.pickedup);
        }
        cartItems=new ArrayList<>();
        getDetails();
        btnCloseDetails.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }
    public void getDetails(){
        RequestQueue queue= Volley.newRequestQueue(this);
        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.GETORDERDETAILS, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject object=new JSONObject(response);
                    if(object.getString("getDetails").equals("success")){
                        Log.d("spaghetti","spaghetti");
                        JSONArray items=object.getJSONArray("order_details");
                        JSONObject item=new JSONObject();
                        for(int i=0;i<items.length();i++){
                            item=items.getJSONObject(i);
                            cartItems.add(new CartItem(item.getString("model"),item.getDouble("price"),item.getInt("quantity")));
                        }
                        setupTable();
                    }
                }
                catch(Throwable t){
                    Log.e("DETAILSERROR",t.getMessage());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }){
            @Override
            protected Map<String,String> getParams(){
                HashMap<String,String> hashMap=new HashMap<>();
                hashMap.put("order_id",order_id);
                return hashMap;
            }
        };
        queue.add(stringRequest);
    }
    public void setupTable(){
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
        for(int i=0;i<cartItems.size();i++){
            TableRow tableRow=new TableRow(this);
            tableRow.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.MATCH_PARENT, TableRow.LayoutParams.MATCH_PARENT));
            tableRow.setPadding(0,0,0,10);
            TextView txtName=new TextView(this);
            txtName.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
            txtName.setGravity(Gravity.LEFT);
            txtName.setTextSize(15);
            txtName.setTextColor(getResources().getColor(R.color.black));
            txtName.setText(cartItems.get(i).getName());
            TextView txtQuantity=new TextView(this);
            txtQuantity.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
            txtQuantity.setGravity(Gravity.RIGHT);
            txtQuantity.setTextSize(15);
            txtQuantity.setTextColor(getResources().getColor(R.color.black));
            txtQuantity.setText(cartItems.get(i).getQuantity()+"");
            TextView txtPrice=new TextView(this);
            txtPrice.setLayoutParams(new TableRow.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT,TableLayout.LayoutParams.WRAP_CONTENT));
            txtPrice.setGravity(Gravity.RIGHT);
            txtPrice.setTextSize(15);
            txtPrice.setTextColor(getResources().getColor(R.color.black));
            price=cartItems.get(i).getPrice()*cartItems.get(i).getQuantity();
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
}
