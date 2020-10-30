package com.example.silen.takeawaysystem;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class login extends AppCompatActivity {
    private Button btnLogin;
    private Button btnRegister;
    private EditText editEmail;
    private EditText editPassword;
    private TextView txtError;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);
        btnLogin=findViewById(R.id.btnLogin);
        btnRegister=findViewById(R.id.btnRegister);
        editEmail=findViewById(R.id.editEmail);
        editPassword=findViewById(R.id.editPassword);
        txtError=findViewById(R.id.txtErrorLogin);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                login();
            }
        });
        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(login.this,Register.class);
                startActivity(intent);
            }
        });
    }
    public void login(){
        txtError.setVisibility(View.GONE);
        RequestQueue queue= Volley.newRequestQueue(this);
        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.LOGIN, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject object=new JSONObject(response);
                    if(object.getString("auth").equals("success")){
                        Intent intent=new Intent(login.this,HomePage.class);
                        HashMap<String,Object> hashMap=new HashMap<>();
                        hashMap.put("name",object.getString("name"));
                        hashMap.put("tel_no",object.getString("tel_no"));
                        hashMap.put("customer_id",object.getInt("customer_id"));
                        intent.putExtra("customer_detail",hashMap);
                        startActivity(intent);
                        finish();
                    }
                    else{
                        txtError.setVisibility(View.VISIBLE);
                        txtError.setText(object.getString("error"));
                    }
                }
                catch(Throwable t){
                    Log.e("JSONERROR",t.getMessage());
                }


            }
        },new Response.ErrorListener(){
            @Override
            public void onErrorResponse(VolleyError error){
                txtError.setVisibility(View.VISIBLE);
                txtError.setText("Couldn't reach the server ! Please check your connection.");
            }
        }){@Override
            protected Map<String,String> getParams(){
            HashMap<String,String> hashMap=new HashMap<>();
            hashMap.put("email",editEmail.getText().toString());
            hashMap.put("password",editPassword.getText().toString());
            hashMap.put("token",MyFirebaseInstanceIDService.TOKEN);
            return hashMap;
        }
        };
        queue.add(stringRequest);
    }
}
