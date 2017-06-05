package com.example.iyadj.cardgame;

import android.text.format.Time;

import java.util.Date;
import java.util.Random;
import java.util.TimeZone;
import java.util.Timer;

/**
 * Created by iyadj on 5/5/2017.
 */
public class DeckOfCards
{
    protected PlayingCard Cards[];
    public DeckOfCards(int CardsNum)
    {
        this.Cards=new PlayingCard[CardsNum];
        char Suits[]={'♠','♥','♦','♣'};
        String Ranks[]={"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
        String m;
        Date k=new Date();
        long r=k.getTime();
       ;
        for(int i=0;i<this.Cards.length;i++)
        {

            int index=(int)(Math.random()*r%13);
            m=Ranks[index];
            index=(int)(Math.random()*r %4);
            m+=Suits[index];
            this.Cards[i]=new PlayingCard(m);
        }
    }
}
