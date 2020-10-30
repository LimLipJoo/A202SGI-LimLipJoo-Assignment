package com.example.silen.takeawaysystem;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.io.IOException;
import java.util.ArrayList;

public class RecommendedAdapter extends RecyclerView.Adapter<RecommendedAdapter.ViewHolder> {
    ArrayList<FoodItem> foodItems=new ArrayList<>();
    Context context;
    onRecommendedMenuListener onRecommendedMenuListener;
    @NonNull
    @Override
    public RecommendedAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        Log.d("hi3","hi4");
        View view=LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.recommended_card,viewGroup,false);
        RecommendedAdapter.ViewHolder viewHolder=new ViewHolder(view,onRecommendedMenuListener);
        return viewHolder;
    }
    public interface onRecommendedMenuListener{
        public void onRecommendedMenuClick(int position,FoodItem foodItem);
    }
    @Override
    public void onBindViewHolder(@NonNull RecommendedAdapter.ViewHolder viewHolder, int i) {
        viewHolder.bindFoodMenu(foodItems.get(i));
    }

    public RecommendedAdapter(ArrayList<FoodItem> foodItems, Context context, RecommendedAdapter.onRecommendedMenuListener onRecommendedMenuListener) {
        Log.d("hi","hi");
        Log.d("list",foodItems.size()+"");
        this.foodItems = foodItems;
        Log.d("fooditems",this.foodItems.size()+"");
        this.context = context;
        this.onRecommendedMenuListener = onRecommendedMenuListener;
        Log.d("end","end");
    }

    @Override
    public int getItemCount() {
        return foodItems.size();
    }
    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener{
        private Context context;
        private TextView txtFoodName,txtFoodPrice;
        private ImageView img;
        onRecommendedMenuListener onRecommendedMenuListener;
        public ViewHolder(@NonNull View itemView,onRecommendedMenuListener onRecommendedMenuListener) {
            super(itemView);
            context=itemView.getContext();
            Log.d("hi3","hi3");
            txtFoodName=itemView.findViewById(R.id.txtNameFoodRecommended);
            txtFoodPrice=itemView.findViewById(R.id.txtPriceRecommended);
            img=itemView.findViewById(R.id.imgRecommended);
            this.onRecommendedMenuListener=onRecommendedMenuListener;
            itemView.setOnClickListener(this);
        }
        public void bindFoodMenu(FoodItem foodItem){
            Log.d("hi","hi2");
            txtFoodName.setText(foodItem.getName());
            txtFoodPrice.setText(String.format("RM %.2f",foodItem.getPrice()));
            GetFoodImage getFoodImage=new GetFoodImage(img);
            getFoodImage.execute(foodItem.getImg());
        }
        @Override
        public void onClick(View view) {
            onRecommendedMenuListener.onRecommendedMenuClick(getAdapterPosition(),foodItems.get(getAdapterPosition()));
        }
    }
    public class GetFoodImage extends AsyncTask<String,Void,Bitmap> {
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
