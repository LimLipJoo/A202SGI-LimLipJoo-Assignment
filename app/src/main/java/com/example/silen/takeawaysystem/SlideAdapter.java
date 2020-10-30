package com.example.silen.takeawaysystem;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.v4.view.PagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.io.IOException;
import java.util.ArrayList;

public class SlideAdapter extends PagerAdapter {
    private Context context;
    LayoutInflater layoutInflater;
    private ArrayList<String> link;
    private ArrayList<String> urlList;
    public SlideAdapter(Context context,ArrayList<String> link,ArrayList<String> urlList) {
        this.context = context;
        this.link=link;
        this.urlList=urlList;
    }

    @Override
    public int getCount() {
        return link.size();
    }

    @Override
    public void destroyItem(@NonNull ViewGroup container, int position, @NonNull Object object) {
        container.removeView((LinearLayout)object);

    }

    @NonNull
    @Override
    public Object instantiateItem(@NonNull ViewGroup container, final int position) {
        layoutInflater=(LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View view=layoutInflater.inflate(R.layout.slideshow_layout,container,false);
        final ImageView img=(ImageView)view.findViewById(R.id.imageView);
        LoadImage loadImage=new LoadImage(img);
        loadImage.execute(link.get(position));
        img.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(Intent.ACTION_VIEW);
                intent.setData(Uri.parse(urlList.get(position)));
                context.startActivity(intent);
            }
        });
        container.addView(view);
        return view;
    }

    @Override
    public boolean isViewFromObject(@NonNull View view, @NonNull Object o) {
        return (view==(LinearLayout)o);
    }

    private class LoadImage extends AsyncTask<String,Void,Bitmap>{
        ImageView view;
        public LoadImage(ImageView view){
            this.view=view;
        }

        @Override
        protected Bitmap doInBackground(String... strings) {
            Bitmap bitmap=null;
            try{
                    bitmap= BitmapFactory.decodeStream(new java.net.URL(strings[0]).openConnection().getInputStream());

            }
            catch (IOException e){
                e.printStackTrace();
                return null;
            }
            return  bitmap;
        }

        @Override
        protected void onPostExecute(Bitmap bitmaps) {
            view.setImageBitmap(bitmaps);
        }
    }
}

