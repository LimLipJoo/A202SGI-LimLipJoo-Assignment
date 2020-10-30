package com.example.silen.takeawaysystem;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.NavigationView;
import android.support.design.widget.TabLayout;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewPager;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
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

public class HomePage extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener,FoodMenuAdapter.OnFoodMenuListener{
    ViewPager viewPager;
    SlideAdapter adapter;
    HashMap<String,Object> user_data;
    ArrayList<String> link=new ArrayList<>();
    ArrayList<String> urlList=new ArrayList<>();
    ArrayList<FoodItem> foodItems=new ArrayList<>();
    TabLayout tabLayout;
    RecyclerView recyclerView;
    FoodMenuAdapter foodMenuAdapter;
    LinearLayoutManager layoutManager;
    ArrayList<Integer> positionList=new ArrayList<>();
    TextView txtCountDialog;
    FloatingActionButton btnCart;
    boolean isUserScrolling;
    Cart cart;
    TextView txtCartCount;
    Button btnAddToCart;
    Button btnRemoveCart;
    ArrayList<CartItem> cartItems;
    TextView txtUser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_page);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setTitle("");
        setSupportActionBar(toolbar);
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();
        cartItems=new ArrayList<>();
        getBanner();
        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        View header=navigationView.getHeaderView(0);
        txtUser=header.findViewById(R.id.txtNameUser);

        navigationView.setNavigationItemSelectedListener(this);
        tabLayout=findViewById(R.id.tab_layout);
        recyclerView=findViewById(R.id.foodMenu);
        layoutManager=new LinearLayoutManager(HomePage.this);
        recyclerView.setLayoutManager(layoutManager);

        user_data=(HashMap<String, Object>)(getIntent().getSerializableExtra("customer_detail"));
        txtUser.setText(user_data.get("name").toString());
        cart=new Cart(this,Integer.parseInt(user_data.get("customer_id").toString()));
        getMenu("init");
        btnCart=findViewById(R.id.fabCart);
        txtCartCount=findViewById(R.id.cartCount);
        if(!cart.isEmpty()){
            btnCart.show();
            txtCartCount.setVisibility(View.VISIBLE);
            txtCartCount.setText(cart.getTotalItems()+"");
        }
        else{
            btnCart.hide();
            txtCartCount.setVisibility(View.GONE);
        }
        btnCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(HomePage.this,OrderPage.class);
                intent.putExtra("customer_id",user_data.get("customer_id")+"");
                startActivityForResult(intent,1);
            }
        });

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode==1){
            if (resultCode==RESULT_CANCELED){
                foodItems.clear();
                getMenu("refresh");
            }
            else if(resultCode==RESULT_OK){
                foodItems.clear();
                getMenu("refresh");
                Intent intent=new Intent(HomePage.this,Order_history.class);
                intent.putExtra("user_data",user_data);
                startActivity(intent);
                finish();
            }
        }
    }

    public void init(){
        RequestQueue queue= Volley.newRequestQueue(this);

        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.GETCART, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    Log.d("Apple","apple");
                    cartItems.clear();
                    cart.setCartItems(cartItems);
                    JSONObject object=new JSONObject(response);
                    if(object.getString("getCart").equals("success")){
                        JSONArray cart=object.getJSONArray("cart");
                        for (int i=0;i<cart.length();i++){
                            cartItems.add(new CartItem(cart.getJSONObject(i).getString("model"),cart.getJSONObject(i).getDouble("price"),cart.getJSONObject(i).getInt("quantity")));
                        }
                        HomePage.this.cart.setCartItems(cartItems);

                    }
                    load();
                }
                catch (Throwable t){
                    Log.d("ERRORBTNCART",t.getMessage());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }){ @Override
        protected Map<String,String> getParams(){
            HashMap<String,String> hashMap=new HashMap<>();
            hashMap.put("customer_id",user_data.get("customer_id").toString()+"");
            return hashMap;
        }
        };
        queue.add(stringRequest);
    }
    public void load(){
        Log.d("pear","pear");
        if(!cart.isEmpty()){
            btnCart.show();
            txtCartCount.setVisibility(View.VISIBLE);
            txtCartCount.setText(cart.getTotalItems()+"");
            ArrayList<CartItem> list=cart.getCartItems();
            for(int i=0;i<list.size();i++){
                for(int x=0;x<foodItems.size();x++){
                    if(list.get(i).getName().equals(foodItems.get(x).getName())){
                        foodItems.get(x).setCount(list.get(i).getQuantity());
                        foodMenuAdapter.updateCount(x);
                    }
                }
            }
        }
        else{
            btnCart.hide();
            txtCartCount.setVisibility(View.GONE);
        }

    }
    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home_page, menu);
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
            Intent intent=new Intent(HomePage.this,login.class);
            startActivity(intent);
            finish();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item){
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.order_historyBtn) {
            Intent intent=new Intent(HomePage.this,Order_history.class);
            intent.putExtra("user_data",user_data);
            startActivity(intent);
            finish();
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
    public void getBanner(){
        try{
            RequestQueue queue= Volley.newRequestQueue(this);
            StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.GETBANNER, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    try{
                        JSONObject object=new JSONObject(response);
                        JSONArray array=object.getJSONArray("banners");
                        if(object.getString("getbanner").equals("success")){
                            for (int i=0;i<array.length();i++){
                                try{
                                    String url=Api.API_IMAGE_ROOT+array.getJSONObject(i).getString("image");
                                    link.add(url);
                                    urlList.add(array.getJSONObject(i).getString("link"));
                                }
                                catch(Exception e){
                                    e.printStackTrace();
                                }
                            }
                            viewPager=findViewById(R.id.slideshow);
                            adapter=new SlideAdapter(HomePage.this,link,urlList);

                            viewPager.setAdapter(adapter);

                        }
                    }
                    catch(Throwable t){
                        Log.e("JSONERROR",t.getMessage()+"SlideCatchOuter");
                    }
                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(HomePage.this, "Couldn't  Reach servers, check your connection", Toast.LENGTH_SHORT).show();
                }
            });
            queue.add(stringRequest);


        }
        catch(Exception e){
            e.printStackTrace();
        }


    }

    @Override
    public void onFoodMenuClick(int position, FoodItem foodItem) {
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
        txtCountDialog.setText(foodItem.getCount()+"");
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

                addToCart(user_data.get("customer_id")+"",foodItem.getProduct_id(),Integer.parseInt(txtCountDialog.getText()+""),position,foodItem);
                dialog.dismiss();
            }
        });
        btnRemoveCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                removeCart(user_data.get("customer_id")+"",foodItem.getProduct_id(),position,foodItem);
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

                        foodItems.get(position).setCount(Integer.parseInt(quantity+""));

                        foodMenuAdapter.updateCount(position);
                        cart.addCartItem(foodItem.getName(),foodItem.getPrice(),foodItem.getCount());
                        if(!cart.isEmpty()){
                            btnCart.show();
                            txtCartCount.setVisibility(View.VISIBLE);
                            txtCartCount.setText(cart.getTotalItems()+"");
                        }
                        else{
                            btnCart.hide();
                            txtCartCount.setVisibility(View.GONE);
                        }
                    }
                    else{
                        Toast.makeText(HomePage.this, "Failed to add to cart!", Toast.LENGTH_SHORT).show();
                    }
                }
                catch(Throwable t){
                    Log.d("errorAdd",t.getMessage());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(HomePage.this, "Failed to add to cart! Check your internet connection!", Toast.LENGTH_SHORT).show();
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
                        foodItems.get(position).setCount(Integer.parseInt(0+""));
                        foodMenuAdapter.updateCount(position);
                        cart.removeCartItem(foodItem.getName());
                        if(!cart.isEmpty()){
                            btnCart.show();
                            txtCartCount.setVisibility(View.VISIBLE);
                            txtCartCount.setText(cart.getTotalItems()+"");
                        }
                        else{
                            btnCart.hide();
                            txtCartCount.setVisibility(View.GONE);
                        }
                    }
                }
                catch(Throwable t){
                    Toast.makeText(HomePage.this, "Failed to add to cart!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(HomePage.this, "Failed to remove from cart! Check your internet connection!", Toast.LENGTH_SHORT).show();
            }
        }){protected Map<String,String> getParams(){
            HashMap<String,String> hashMap=new HashMap<>();
            hashMap.put("customer_id",customer_id+"");
            hashMap.put("product_id",product_id+"");
            return hashMap;
        }};
        queue.add(stringRequest);
    }

    public void getMenu(final String statusCode){

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
                            foodItems.clear();
                            for(int i=0;i<menu.length();i++){
                                temp=menu.getJSONObject(i);
                                url=Api.API_IMAGE_ROOT+temp.getString("image");

                                foodItems.add(new FoodItem(temp.getString("model"),temp.getString("name"),temp.getDouble("price"),url,temp.getInt("product_id")));
                            }
                            JSONArray count=object.getJSONArray("counter");
                            int total=0;
                            Log.d("countLength",count.length()+"");
                            tabLayout.removeAllTabs();
                            for(int i=0;i<count.length();i++){
                                tabLayout.addTab(tabLayout.newTab().setText(count.getJSONObject(i).getString("name")));
                                total+=Integer.parseInt(count.getJSONObject(i).getString("count"));
                                Log.d("total",total+"");
                                positionList.add(total);
                            }

                            syncTabWithRecyclerView();
                            init();
                        }
                        else{
                            //empty case
                            TextView txtError=findViewById(R.id.menuErrorTxt);
                            ImageView imgError=findViewById(R.id.menuErrorImg);
                            imgError.setImageResource(R.drawable.errorempty);
                            txtError.setText("No Item Found!");
                            txtError.setVisibility(View.VISIBLE);
                            imgError.setVisibility(View.VISIBLE);
                        }
                    }
                    catch(Throwable t){
                        t.printStackTrace();
                    }
                    Log.d("size",foodItems.size()+"");
                    if(statusCode.equals("init")){

                        foodMenuAdapter=new FoodMenuAdapter(HomePage.this,foodItems,HomePage.this);
                        recyclerView.setAdapter(foodMenuAdapter);
                    }
                    else{
                        foodMenuAdapter.updateAll(foodItems);
                    }
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
    public void syncTabWithRecyclerView(){
        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                if(!isUserScrolling){
                    int position=tab.getPosition();
                    Log.d("position",position+"");
                    if(position == 0){
                        recyclerView.smoothScrollToPosition(position);
                    }
                    else
                        recyclerView.smoothScrollToPosition((positionList.get(position)-1));
                }
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(@NonNull RecyclerView recyclerView, int newState) {
                if(newState==RecyclerView.SCROLL_STATE_DRAGGING){
                    isUserScrolling=true;
                }
                else if(newState== RecyclerView.SCROLL_STATE_IDLE){
                    isUserScrolling=false;
                }
            }

            @Override
            public void onScrolled(@NonNull RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                int itemPosition=layoutManager.findFirstVisibleItemPosition();
                if(isUserScrolling){
                    for(int i=0;i<positionList.size();i++){
                        if(itemPosition==positionList.get(i)-1){
                            itemPosition=i;
                            break;
                        }
                    }
                    TabLayout.Tab tab=tabLayout.getTabAt(itemPosition);
                    tab.select();
                }
            }
        });
    }
}
