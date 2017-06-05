package com.example.iyadj.cardgame;

/**
 * Created by iyadj on 5/5/2017.
 */
public class Matcher {
    protected DeckOfCards Deck;
    protected boolean Match;
    protected int Score;
    protected boolean PlayMode;
    public Matcher(int CardsNum) {
        this.Deck = new DeckOfCards(CardsNum);
        this.Score = 0;
        this.Match = false;
        this.PlayMode=false;
    }

    public int getScore()
    {
        return this.Score;
    }
    public void setPlayMode(boolean mode)
    {
        this.PlayMode=mode;
    }
    public boolean isMatch(int i,int index)
    {
        return this.Deck.Cards[i].getSuit().equals(this.Deck.Cards[index].getSuit())||this.Deck.Cards[i].getRank().equals(this.Deck.Cards[index].getRank());
    }
    public boolean match3Cards(int index)
    {
        return false;
    }
    public boolean match2Cards(int index)
    {
        this.Deck.Cards[index].setFaceUp(true);
        for(int i=0;i<this.Deck.Cards.length;i++)
        {
            if(i!=index&&this.Deck.Cards[i].isFaceUp()&&this.Deck.Cards[i].isPlayaple())
            {
                System.out.println("hi");
                if(isMatch(i,index))
                {
                    this.Deck.Cards[index].setPlayaple(false);
                    this.Deck.Cards[i].setPlayaple(false);
                    this.Score+=4;
                    return true;
                }
                else
                {
                    this.Deck.Cards[i].setFaceUp(false);
                    this.Deck.Cards[index].setFaceUp(false);
                }
            }
        }
        return false;
    }

    public DeckOfCards getDeck()
    {
        return this.Deck;
    }
    public void cardFlipped(int index)
    {

        if(!this.Deck.Cards[index].isPlayaple())
            return;
        else if(this.Deck.Cards[index].isFaceUp())
        {
            this.Deck.Cards[index].setFaceUp(false);
            return;
        }
        else if(this.PlayMode)
        {
            this.Match=match2Cards(index);
        }
        else
        {
            this.Match=match3Cards(index);
        }
        Score--;
    }
}
