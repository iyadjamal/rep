package com.example.iyadj.cardgame;

/**
 * Created by iyadj on 5/5/2017.
 */
public class PlayingCard extends Card {
    protected String Suit;
    protected String Rank;

    public PlayingCard(String c) {
        super(c);
        this.Suit = "" + c.charAt(c.length() - 1);
        this.Rank = c.split(this.Suit)[0];
    }

    public String getSuit() {
        return this.Suit;
    }

    public String getRank()
    {
        return this.Rank;
    }
    public void setContent(String c)
    {
        super.setContent(c);
        this.Suit = "" + c.charAt(c.length() - 1);
        this.Rank = c.split(this.Suit)[0];
    }
}
