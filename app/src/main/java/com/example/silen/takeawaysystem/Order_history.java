package com.example.silen.takeawaysystem;

import android.content.Intent;
import android.media.Image;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Order_history extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener,HistoryAdapter.OnHistoryClickListener{
    private HashMap<String,Object> user_data;
    private ArrayList<Order> orders;
    private RecyclerView recyclerView;
    private HistoryAdapter adapter;
    private TextView txtError;
    private ImageView imgError;
    private TextView txtUser;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_history);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setTitle("");
        setSupportActionBar(toolbar);
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();
        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        View header=navigationView.getHeaderView(0);
        navigationView.setNavigationItemSelectedListener(this);
        user_data=(HashMap<String, Object>)(getIntent().getSerializableExtra("user_data"));
        orders=new ArrayList<>();
        recyclerView=findViewById(R.id.recycleHistory);
        txtUser=header.findViewById(R.id.txtNameUser);
        txtUser.setText(user_data.get("name").toString());
        getHistory();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home_page, menu);
        return true;
    }
    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
        int id = menuItem.getItemId();

        if (id == R.id.home_btn) {
            // Handle the camera action
            Intent intent=new Intent(Order_history.this,HomePage.class);
            intent.putExtra("customer_detail",user_data);
            startActivity(intent);
            finish();

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.btnLogout) {
            Intent intent=new Intent(Order_history.this,login.class);
            startActivity(intent);
            finish();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
    public void getHistory(){
        RequestQueue queue= Volley.newRequestQueue(this);
        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.ORDERHISTORY, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject object=new JSONObject(response);
                    if(object.getString("orderHistory").equals("success")){
                        Log.d("pine","pine");
                        JSONArray history=object.getJSONArray("history");
                        for(int i=0;i<history.length();i++){
                            orders.add(new Order(history.getJSONObject(i).getInt("order_id"),history.getJSONObject(i).getString("date_ordered"),history.getJSONObject(i).getDouble("total"),history.getJSONObject(i).getString("status")));
                        }
                        LinearLayoutManager linearLayoutManager=new LinearLayoutManager(Order_history.this);
                        adapter=new HistoryAdapter(orders,Order_history.this,Order_history.this);
                        recyclerView.setLayoutManager(linearLayoutManager);
                        recyclerView.setAdapter(adapter);
                    }
                    else{
                        txtError=findViewById(R.id.txtErrorHistory);
                        imgError=findViewById(R.id.imgErrorHistory);
                        txtError.setVisibility(View.VISIBLE);
                        imgError.setVisibility(View.VISIBLE);
                        recyclerView.setVisibility(View.GONE);
                    }
                }
                catch (Throwable t){
                    Log.e("HISTORY_ERROR",t.getMessage());
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
                hashMap.put("customer_id",user_data.get("customer_id").toString()+"");
                return hashMap;
            }
        };
        queue.add(stringRequest);
    }

    @Override
    public void onHistoryClick(int position, Order order) {
        Intent intent=new Intent(Order_history.this,Order_Details.class);
        intent.putExtra("order_id",order.getOrder_id()+"");
        intent.putExtra("status",order.getStatus()+"");
        intent.putExtra("date",order.getDate()+"");
        startActivity(intent);
    }
}
