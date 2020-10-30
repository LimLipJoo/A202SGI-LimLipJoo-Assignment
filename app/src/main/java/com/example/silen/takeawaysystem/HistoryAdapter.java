package com.example.silen.takeawaysystem;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.text.DateFormat;
import java.util.ArrayList;

public class HistoryAdapter extends RecyclerView.Adapter<HistoryAdapter.HistoryViewHolder> {
    private ArrayList<Order> orders;
    Context context;
    OnHistoryClickListener onHistoryClickListener;

    public HistoryAdapter(ArrayList<Order> orders, Context context, OnHistoryClickListener onHistoryClickListener) {
        this.orders = orders;
        this.context = context;
        this.onHistoryClickListener = onHistoryClickListener;
    }

    @NonNull
    @Override
    public HistoryViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        View view= LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.history_card,viewGroup,false);
        HistoryViewHolder historyViewHolder=new HistoryViewHolder(view,onHistoryClickListener);
        return historyViewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull HistoryViewHolder historyViewHolder, int i) {
            historyViewHolder.bindHistory(orders.get(i));
    }

    @Override
    public int getItemCount() {
        return orders.size();
    }
    public interface OnHistoryClickListener{
        public void onHistoryClick(int position,Order order);
    }
    public class HistoryViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener{
        private ImageView img;
        private TextView txtDate;
        private TextView txtTotal;
        private TextView txtStatus;

        public HistoryViewHolder(@NonNull View itemView,OnHistoryClickListener onHistoryClickListener) {
            super(itemView);
            txtDate=itemView.findViewById(R.id.txtHistoryDate);
            txtTotal=itemView.findViewById(R.id.txtTotalHistory);
            txtStatus=itemView.findViewById(R.id.txtStatus);
            img=itemView.findViewById(R.id.imgHistory);
            itemView.setOnClickListener(this);
        }
        public void bindHistory(Order order){
            txtDate.setText(order.getDate());
            txtTotal.setText(String.format("RM%.2f",order.getTotal()));
            txtStatus.setText(order.getStatus());
            img.setImageResource(R.drawable.foodimg);
        }
        @Override
        public void onClick(View view) {
            onHistoryClickListener.onHistoryClick(getAdapterPosition(),orders.get(getAdapterPosition()));
        }
    }
}
