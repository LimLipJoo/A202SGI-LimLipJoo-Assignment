package com.example.silen.takeawaysystem;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.io.IOException;
import java.util.ArrayList;

public class FoodMenuAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder>{
    private ArrayList<FoodItem> list=new ArrayList<>();
    Context context;
    OnFoodMenuListener onFoodMenuListener;
    static String category="";
    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        switch(i){
            case 0:View view= LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.menu_card,viewGroup,false);
                FoodViewHolder foodViewHolder=new FoodViewHolder(view,onFoodMenuListener);
                return foodViewHolder;
            case 1:View view1=LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.foodtitle,viewGroup,false);
                FoodTitleHolder foodTitleHolder=new FoodTitleHolder(view1,onFoodMenuListener);
                return foodTitleHolder;
        }
        return null;
    }
    public void updateCount(int position){
        this.notifyItemChanged(position);
    }
    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder foodViewHolder, int i) {
        switch (foodViewHolder.getItemViewType()){
            case 0:((FoodViewHolder)foodViewHolder).bindFoodMenu(list.get(i));
                    break;
            case 1:((FoodTitleHolder)foodViewHolder).bindFoodTitle(category,list.get(i));
                    break;
        }

    }
    public void updateAll(ArrayList<FoodItem> foodItems){
        list.clear();
        list.addAll(foodItems);
        this.notifyDataSetChanged();
    }
    public interface OnFoodMenuListener{
        public void onFoodMenuClick(int position,FoodItem foodItem);
    }
    public FoodMenuAdapter(Context context, ArrayList<FoodItem> list,OnFoodMenuListener onFoodMenuListener) {
        this.context=context;
        this.list.addAll(list);
        this.onFoodMenuListener=onFoodMenuListener;
    }

    @Override
    public int getItemViewType(int position) {
        if(list.get(position).getCategory().equals(category)){
            return 0;
        }
        else{
            category=list.get(position).getCategory();
            return 1;
        }
    }

    @Override
    public int getItemCount() {
        return list.size();
    }
    public class FoodViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener{
        private TextView txtFoodName,txtFoodPrice,txtCount;
        ImageView img;
        OnFoodMenuListener onFoodMenuListener;

        public FoodViewHolder(@NonNull View itemView,OnFoodMenuListener onFoodMenuListener) {
            super(itemView);
            txtFoodName=itemView.findViewById(R.id.txtFoodName);
            txtFoodPrice=itemView.findViewById(R.id.txtFoodPrice);
            txtCount=itemView.findViewById(R.id.txtCount);
            this.onFoodMenuListener=onFoodMenuListener;
            img=itemView.findViewById(R.id.imgFood);
            itemView.setOnClickListener(this);
        }

        public void bindFoodMenu(FoodItem foodItem){
            txtFoodName.setText(foodItem.getName());
            txtFoodPrice.setText(String.format("RM %.2f",foodItem.getPrice()));
            txtCount.setText("x "+foodItem.getCount()+"");
            if(foodItem.getCount()>0){
                txtCount.setVisibility(View.VISIBLE);
            }else{
                txtCount.setVisibility(View.INVISIBLE);
            }
            GetFoodImage getFoodImage=new GetFoodImage(img);
            getFoodImage.execute(foodItem.getImg());
        }

        @Override
        public void onClick(View view) {
            Log.d("hi","bye");
            onFoodMenuListener.onFoodMenuClick(getAdapterPosition(),list.get(getAdapterPosition()));
        }

    }
    public class FoodTitleHolder extends RecyclerView.ViewHolder implements View.OnClickListener{
        private TextView txtTitleFood;
        private TextView txtFoodNameTitle;
        private  TextView txtFoodPriceTitle;
        private  TextView txtCountTitle;
        private CardView cardView;
        private ImageView imgTitle;
        private  OnFoodMenuListener onFoodMenuListener;

        public FoodTitleHolder(@NonNull View itemView,OnFoodMenuListener onFoodMenuListener) {
            super(itemView);
            this.txtTitleFood = itemView.findViewById(R.id.txtFoodTitle);
            txtFoodNameTitle=itemView.findViewById(R.id.txtFoodNameTitle);
            txtFoodPriceTitle=itemView.findViewById(R.id.txtFoodPriceTitle);
            txtCountTitle=itemView.findViewById(R.id.txtCountTitle);
            imgTitle=itemView.findViewById(R.id.imgTitle);
            cardView=itemView.findViewById(R.id.cardTitle);
            this.onFoodMenuListener=onFoodMenuListener;
        }

        public void bindFoodTitle(String category,FoodItem foodItem){
            txtTitleFood.setText(category);
            txtFoodNameTitle.setText(foodItem.getName());
            txtFoodPriceTitle.setText(String.format("RM %.2f",foodItem.getPrice()));
            txtCountTitle.setText("x "+foodItem.getCount()+"");
            if(foodItem.getCount()>0){
                txtCountTitle.setVisibility(View.VISIBLE);
            }
            else{
                txtCountTitle.setVisibility(View.INVISIBLE);
            }
            cardView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    onFoodMenuListener.onFoodMenuClick(getAdapterPosition(),list.get(getAdapterPosition()));
                }
            });
            GetFoodImage getFoodImage=new GetFoodImage(imgTitle);
            getFoodImage.execute(foodItem.getImg());
        }

        @Override
        public void onClick(View view) {
            Log.d("hi","hi");


        }
    }
    public class GetFoodImage extends AsyncTask<String,Void,Bitmap>{
        ImageView view;

        public GetFoodImage(ImageView view) {
            this.view = view;
        }

        @Override
        protected Bitmap doInBackground(String... strings) {
            Bitmap bitmap=null;
            try{
                bitmap= BitmapFactory.decodeStream(new java.net.URL(strings[0]).openConnection().getInputStream());
            }
            catch(IOException e){
                e.printStackTrace();
                return null;
            }
            return bitmap;
        }

        @Override
        protected void onPostExecute(Bitmap bitmap) {
            view.setImageBitmap(bitmap);
        }
    }
}
