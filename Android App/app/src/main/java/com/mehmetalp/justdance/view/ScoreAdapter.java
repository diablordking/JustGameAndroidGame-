package com.mehmetalp.justdance.view;


import android.content.Context;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.support.design.widget.Snackbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.google.firebase.auth.FirebaseAuth;
import com.koushikdutta.ion.Ion;
import com.mehmetalp.justdance.R;
import com.mehmetalp.justdance.models.Score;

import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ScoreAdapter extends ArrayAdapter<Score> implements View.OnClickListener{

    private ArrayList<Score> dataSet;
    Context mContext;

    // View lookup cache
    private static class ViewHolder {
        TextView txtName;
        TextView txtType;
        TextView txtVersion;
        ImageView profilpic;
        TextView scoredate;
    }

    public ScoreAdapter(ArrayList<Score> data, Context context) {
        super(context, R.layout.row_item, data);
        this.dataSet = data;
        this.mContext=context;

    }



    @Override
    public void onClick(View v) {

        int position=(Integer) v.getTag();
        Object object= getItem(position);
        Score dataModel=(Score)object;


    }

    private int lastPosition = -1;

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Get the data item for this position
        Score dataModel = getItem(position);
        // Check if an existing view is being reused, otherwise inflate the view
        ViewHolder viewHolder; // view lookup cache stored in tag

        final View result;

        if (convertView == null) {

            viewHolder = new ViewHolder();
            LayoutInflater inflater = LayoutInflater.from(getContext());
            convertView = inflater.inflate(R.layout.row_item, parent, false);
            viewHolder.txtName = (TextView) convertView.findViewById(R.id.name);
            viewHolder.txtType = (TextView) convertView.findViewById(R.id.type);
            viewHolder.txtVersion = (TextView) convertView.findViewById(R.id.version_number);
            viewHolder.profilpic = (ImageView) convertView.findViewById(R.id.iv_cover);
            viewHolder.scoredate = (TextView) convertView.findViewById(R.id.scoredate);


            result=convertView;

            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
            result=convertView;
        }

        Animation animation = AnimationUtils.loadAnimation(mContext, (position > lastPosition) ? R.anim.up_from_bottom : R.anim.down_from_top);
        result.startAnimation(animation);
        lastPosition = position;

        if(dataModel.getType() != null) {


        if (dataModel.getType().equals("Rhyme Game"))
        {
            Ion.with(viewHolder.profilpic).load("file:///android_asset/rhyme.gif");
        }
        else {
            Ion.with(viewHolder.profilpic).load("file:///android_asset/giphy.gif");
        }
        }
        else {
            Ion.with(viewHolder.profilpic).load("file:///android_asset/giphy.gif");
        }
        viewHolder.txtName.setText(dataModel.getType());
        viewHolder.txtVersion.setText(dataModel.getPoint()+"");
        viewHolder.scoredate.setText(dataModel.getScoreDate());
//        viewHolder.info.setOnClickListener(this);
  //      viewHolder.info.setTag(position);
        // Return the completed view to render on screen
        return convertView;
    }
}