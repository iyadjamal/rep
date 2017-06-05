package com.example.iyadj.cardgame;

import android.content.res.ColorStateList;
import android.support.v7.app.AppCompatActivity;
import android.os.*;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TextView;
import com.example.iyadj.cardgame.*;

import java.util.Date;

public class MainActivity extends AppCompatActivity {
    public Matcher m;
    public Button button[];
    public TextView lblScore;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
               WindowManager.LayoutParams.FLAG_FULLSCREEN);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_main);
        button=new Button[16];
        for(int i=0;i<16;i++) {
            button[i] = (Button) findViewById(getResources().getIdentifier("b" + i, "id",
                    this.getPackageName()));
            button[i].setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Clicked(v);
                }
            });
            button[i].setTextSize(44);
            button[i].setText("\uD83C\uDF1F");
            this.lblScore=(TextView) findViewById(R.id.yourScore) ;

        }
        m=new Matcher(16);
        m.setPlayMode(true);
    }
    protected void Clicked(View v)
    {
        for(int i=0;i<this.button.length;i++) {

            if(v.equals(button[i]))
            {
                if(m.Deck.Cards[i].isPlayaple())
                {

                    button[i].setText(m.Deck.Cards[i].getContent());
                    button[i].setTextSize(20);
                    button[i].setBackgroundColor(0xffffffff);

                    if(m.Deck.Cards[i].isPlayaple())
                        button[i].setTextColor(0xFF000000);
                    else if(!m.Deck.Cards[i].isPlayaple())
                        button[i].setTextColor(0x0F000000);
                    m.cardFlipped(i);
                    Date k=new Date();
                    long wait=k.getTime()+150;


                }
                break;
            }
        }

        for(int i=0;i<button.length;i++)
        {
            if(m.Deck.Cards[i].isFaceUp())
            {
                System.out.println(m.getScore());
                this.lblScore.setText("Score : "+m.getScore());
                button[i].setText(m.Deck.Cards[i].getContent());
                button[i].setTextSize(20);
                button[i].setBackgroundColor(0xffffffff);

                if(m.Deck.Cards[i].isPlayaple())
                    button[i].setTextColor(0xFF000000);
                else if(!m.Deck.Cards[i].isPlayaple())
                    button[i].setTextColor(0x0F000000);

            }
            else
            {

                button[i].setText("\uD83C\uDF1F");
                button[i].setTextSize(44);
                button[i].setBackgroundColor(0xFFed0000);
            }


        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        //d=new DeckOfCards(10);

    }
}
