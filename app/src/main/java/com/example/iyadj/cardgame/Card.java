package com.example.iyadj.cardgame;

/**
 * Created by iyadj on 5/4/2017.
 */
public class Card
{
    protected String Content;
    protected  boolean FaceUp;
    protected  boolean Playaple;
    public Card(String c)
    {
        FaceUp=false;
        this.Content=c;
        Playaple=true;
    }
    public boolean isFaceUp()
    {
        return FaceUp;
    }
    public void setFaceUp(boolean f)
    {
        this.FaceUp=f;
    }
    public boolean isPlayaple()
    {
        return this.Playaple;
    }
    public void setPlayaple(boolean p)
    {
        this.Playaple=p;
    }
    public String getContent()
    {
        return this.Content;
    }
    public void setContent(String c)
    {
        this.Content=c;
    }

}
