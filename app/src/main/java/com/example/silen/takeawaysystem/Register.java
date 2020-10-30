package com.example.silen.takeawaysystem;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.util.Patterns;
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
import java.util.regex.Pattern;

public class Register extends AppCompatActivity {
    private EditText editEmail;
    private EditText editPassword;
    private EditText editTelno;
    private EditText editFname;
    private EditText editLname;
    private Button btnRegister;
    private TextView txtError;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        editEmail=findViewById(R.id.editEmailRegister);
        editPassword=findViewById(R.id.editPasswordRegister);
        editTelno=findViewById(R.id.editTelephone);
        editFname=findViewById(R.id.editFname);
        editLname=findViewById(R.id.editLname);
        btnRegister=findViewById(R.id.btnRegister);
        txtError=findViewById(R.id.txtErrorRegister);

        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                txtError.setVisibility(View.GONE);
                boolean valid=true;
                Pattern pattern=Patterns.EMAIL_ADDRESS;
                if(editEmail.getText().toString().isEmpty()){
                    editEmail.setError("E-mail cannot be empty");
                    valid=false;
                }
                else if(!pattern.matcher(editEmail.getText().toString()).matches()){
                    editEmail.setError("Enter a valid E-mail");
                    valid=false;
                }
                pattern=Pattern.compile("(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}");
                if(editPassword.getText().toString().isEmpty()){
                    editPassword.setError("Password cannot be empty");
                    valid=false;
                }
                else if(!pattern.matcher(editPassword.getText().toString()).matches()){
                    editPassword.setError("Password must have minimum 8 characters, 1 capital and 1 number");
                    valid=false;
                }
                pattern=Pattern.compile("^[0-9]{10,10}$");
                if(editTelno.getText().toString().isEmpty()){
                    editTelno.setError("Telephone cannot be empty");
                    valid=false;
                }
                else if(!pattern.matcher(editTelno.getText().toString()).matches()){
                    editTelno.setError("Enter a valid telephone number");
                    valid=false;
                }
                pattern=Pattern.compile("^[a-zA-Z\\s]+$");
                if(editFname.getText().toString().isEmpty()){
                    editFname.setError("First name cannot be empty");
                    valid=false;
                }
                else if(!pattern.matcher(editFname.getText().toString()).matches()){
                    editFname.setError("Enter a valid First name");
                    valid=false;
                }
                if(editLname.getText().toString().isEmpty()){
                    editLname.setError("Last name cannot be empty");
                    valid=false;
                }
                else if(!pattern.matcher(editLname.getText().toString()).matches()){
                    editLname.setError("Enter a valid Last name");
                    valid=false;
                }
                if(valid){
                    Register();
                }
            }
        });
    }
    public void Register(){
        RequestQueue queue=Volley.newRequestQueue(this);
        StringRequest stringRequest=new StringRequest(Request.Method.POST, Api.REGISTER, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject object=new JSONObject(response);
                    if(object.getString("reg").equals("success")){
                        Intent intent=new Intent(Register.this,login.class);
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
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                txtError.setVisibility(View.VISIBLE);
                txtError.setText("Couldn't reach the server ! Please check your connection.");
            }
        }){
            @Override
            protected Map<String,String> getParams(){
                HashMap<String,String> hashMap=new HashMap<>();
                hashMap.put("email",editEmail.getText().toString());
                hashMap.put("password",editPassword.getText().toString());
                hashMap.put("tel_no",editTelno.getText().toString());
                hashMap.put("f_name",editFname.getText().toString());
                hashMap.put("l_name",editLname.getText().toString());
                return hashMap;
            }
        };
        queue.add(stringRequest);
    }
}
