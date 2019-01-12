package com.mehmetalp.justdance;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.ImageView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.mehmetalp.justdance.models.Score;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link DanceAnimGameFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link DanceAnimGameFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class DanceAnimGameFragment extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    private ImageView ivAndroid;
    private AnimationDrawable frameAnimation;

    private FirebaseAuth auth;
    private DatabaseReference mFirebaseDatabase;
    private FirebaseDatabase mFirebaseInstance;
    long totalSize = 0;
    private String userId;


    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;
    private Button btnStop;
    private Button btnStart;
    private WebView mWebView;
    View rootView;

    private OnFragmentInteractionListener mListener;

    public DanceAnimGameFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment DanceAnimGameFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static DanceAnimGameFragment newInstance(String param1, String param2) {
        DanceAnimGameFragment fragment = new DanceAnimGameFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }
    private void createScore(String userid,Score score) {
        mFirebaseInstance = FirebaseDatabase.getInstance();

        // get reference to 'score' node
        mFirebaseDatabase = mFirebaseInstance.getReference("score");

        String orderid  = mFirebaseDatabase.push().getKey();


        mFirebaseDatabase.child(userid).child(orderid).setValue(score);



    }

    private class MyWebChromeClient extends WebChromeClient {
        @Override
        public boolean onJsAlert(WebView view, String url, String message, JsResult result) {

            auth = FirebaseAuth.getInstance();

            PointCalculation pointer = new PointCalculation();
            Double resultOfCalculation = pointer.CalculationFloss(Double.parseDouble(message));
            Date scoreDate = new Date();

            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
            String strDate = dateFormat.format(scoreDate);

            Score jsgameresult= new Score("Rhyme Game",resultOfCalculation.intValue(),auth.getCurrentUser().getDisplayName(),strDate);
            userId = auth.getUid();


            // showAlert(result);

            createScore(userId,jsgameresult);

            Log.d("LogTag", message);

            result.confirm();
            return true;
        }
    }
    private class MyWebViewClient extends WebViewClient {
        @Override
        public void onPageFinished (WebView view, String url){
            view.loadUrl("javascript:alert(functionThatReturnsSomething())");
        }
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            return false;
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

      rootView = inflater.inflate(R.layout.fragment_dance_anim_game, container, false);
        runThread();


        return rootView;
    }

    private void runThread() {

        new Thread() {
            public void run() {

                try {
                    getActivity().runOnUiThread(new Runnable() {

                        @Override
                        public void run() {

                            mWebView = (WebView) rootView.findViewById(R.id.webview);
                            mWebView.setWebViewClient(new MyWebViewClient());
                            mWebView.setWebChromeClient(new MyWebChromeClient());
                            mWebView = (WebView) rootView.findViewById(R.id.webview);
                            mWebView.loadUrl("file:///android_asset/jsDance/main.html");

                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                                mWebView.setLayerType(View.LAYER_TYPE_HARDWARE, null);
                            }
                            else {
                                mWebView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
                            }
                            // Enable Javascript
                            WebSettings webSettings = mWebView.getSettings();
                            webSettings.setJavaScriptEnabled(true);

                            //Webview performans
                            mWebView.getSettings().setRenderPriority(WebSettings.RenderPriority.HIGH);
                            mWebView.getSettings().setCacheMode(WebSettings.LOAD_CACHE_ELSE_NETWORK);
                            mWebView.getSettings().setAppCacheEnabled(true);
                            mWebView.getSettings().setDomStorageEnabled(true);
                            // Force links and redirects to open in the WebView instead of in a browser
                            mWebView.setWebViewClient(new WebViewClient());


                        }
                    });
                    Thread.sleep(1);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }.start();
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
