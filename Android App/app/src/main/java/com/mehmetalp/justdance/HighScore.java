package com.mehmetalp.justdance;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.mehmetalp.justdance.models.Score;
import com.mehmetalp.justdance.models.User;
import com.mehmetalp.justdance.view.HighScoreAdapter;
import com.mehmetalp.justdance.view.ScoreAdapter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link HighScore.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link HighScore#newInstance} factory method to
 * create an instance of this fragment.
 */
public class HighScore extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    ArrayList<Score> dataModels;
    ListView listView;
    private static HighScoreAdapter adapter;
    private FirebaseAuth auth;
    ArrayList<Score> scoreList;
    User user2;
    private DatabaseReference databaseOrders,databaseOrders2;


    private OnFragmentInteractionListener mListener;

    public HighScore() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment HighScore.
     */
    // TODO: Rename and change types and number of parameters
    public static HighScore newInstance(String param1, String param2) {
        HighScore fragment = new HighScore();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onStart() {
        super.onStart();
        runThread();

    }
    private void runThread() {

        new Thread() {
            public void run() {

                try {
                    getActivity().runOnUiThread(new Runnable() {

                        @Override
                        public void run() {



                            databaseOrders = FirebaseDatabase.getInstance().getReference("score");

                            databaseOrders.addValueEventListener(new ValueEventListener() {
                                @Override
                                public void onDataChange(DataSnapshot dataSnapshot) {
                                    scoreList.clear();
                                    for (DataSnapshot postSnapshot : dataSnapshot.getChildren()) {
                                        for (DataSnapshot postSnapshot2 : postSnapshot.getChildren()) {



                                            Score score = postSnapshot2.getValue(Score.class);
                                            scoreList.add(score); }
                                    }
                                    Collections.sort(scoreList, new Comparator<Score>(){
                                        public int compare(Score obj1, Score obj2) {
                                            // ## Ascending order
                                            //return obj1.getPoint().compareToIgnoreCase(obj2.getPoint()); // To compare string values
                                            // return Integer.valueOf(obj1.getPoint()).compareTo(Integer.valueOf(obj2.getPoint())); // To compare integer values

                                            // ## Descending order
                                            // return obj2.firstName.compareToIgnoreCase(obj1.firstName); // To compare string values
                                            return Integer.valueOf(obj2.getPoint()).compareTo(Integer.valueOf(obj1.getPoint())); // To compare integer values
                                        }
                                    });
                                    adapter = new HighScoreAdapter(scoreList, getActivity().getBaseContext());
                                    listView.setAdapter(adapter);
                                }

                                @Override
                                public void onCancelled(@NonNull DatabaseError databaseError) {

                                }


                            });


                        }
                    });
                    Thread.sleep(1);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }.start();
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView =inflater.inflate(R.layout.fragment_high_score, container, false);

        listView=(ListView)rootView.findViewById(R.id.list);

        scoreList = new ArrayList<>();

        adapter= new HighScoreAdapter(scoreList,getActivity());

        // Inflate the layout for this fragment
        return rootView;
        // Inflate the layout for this fragment
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
}
