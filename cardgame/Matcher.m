//
//  Matcher.m
//  cardgame
//
//  Created by Student on 3/28/17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Matcher.h"
#import "PlayingCard.h"
#import "PlayCardDeck.h"

@implementation Matcher
-(id)initWithCardNumber:(NSUInteger)cardNum
{
    
    self =[super init];
    _cards=[[NSMutableArray alloc] init];
    if(self)
    {
        PlayCardDeck *deck= [[PlayCardDeck alloc] init];
        //draw 16 card
        for(int i=0;i<cardNum;i++)
        {
            PlayingCard*c=(PlayingCard*) [deck drawRandomCard];
            [self.cards addObject:c];
        }
    }
    self.Score=0;
    self.Mode3or2=YES;
    return self;
}
-(void)cardFlipped:(NSUInteger)index
{
    PlayingCard *card = self.cards[index];
    self.match=NO;
    if (card.isUnplayable)
        return;
    
    if ( card.isFaceUp )
        [card setFaceUp:NO];
    else
    {
        self.Score--;
        
        [card setFaceUp:YES];
        if(self.Mode3or2)
        {
            for (int i = 0 ; i < [ self.cards count] ; i++)
            {
                PlayingCard *card2 = self.cards[i];
           
                if ( i != index && [ card2 isFaceUp] && ![card2 isUnplayable])
                {
                    if ( card.rank == card2.rank ||
                        [card.suit isEqual:card2.suit])
                    {
                        self.Score = self.Score + 4;
                    
                        [card setUnplayable:YES];
                        [card2 setUnplayable:YES];
                        self.match=YES;
                        break;
                    }
                    else
                    {
                    
                        [card setFaceUp:NO];
                        [card2 setFaceUp:NO];
                        break;
                    
                    }//else
                }//if
                
            }//for
            
            
        }//if
        else
        {
            for (int i = 0 ; i < [ self.cards count] ; i++)
            {
                PlayingCard *card2 = self.cards[i];
                
                for(int j=0;j<[self.cards count];j++)
                {
                    
                    PlayingCard *card3 = self.cards[j];
                    if ( i != index && j!=index && i!=j&& [ card2 isFaceUp] && ![card2 isUnplayable]&&[card3 isFaceUp]&& ![card3 isUnplayable])
                    {
                        NSLog(@"I AM HERE");
                        if ( (card.rank == card2.rank ||[card.suit isEqual:card2.suit])&&((card.rank == card3.rank ||[card.suit isEqual:card3.suit]))&&((card3.rank == card2.rank ||[card3.suit isEqual:card2.suit])))
                        {
                            self.Score = self.Score + 4;
                        
                            [card setUnplayable:YES];
                            [card2 setUnplayable:YES];
                            [card3 setUnplayable:YES];
                            self.match=YES;
                            break;
                        }
                        else
                        {
                        
                            [card setFaceUp:NO];
                            [card2 setFaceUp:NO];
                            [card3 setFaceUp:NO];
                            break;
                        
                        }//else
                    }//if
                }
            }//for
            BOOL one=NO;
            for(int i=0;i<[self.cards count];i++)
            {
                PlayingCard *card1 = self.cards[i];
                if([card1 isUnplayable])
                    continue;
                for(int j=0;j<[self.cards count];j++)
                {
                    PlayingCard *card2 = self.cards[j];
                    if([card2 isUnplayable])
                        continue;
                    for(int k=0;k<[self.cards count];k++)
                    {
                        PlayingCard *card3 = self.cards[k];
                        if([card3 isUnplayable])
                            continue;
                        if ( i != k && j!=k && i!=j)
                        {
                           
                            if ( ((card1.rank == card2.rank ||[card1.suit isEqual:card2.suit]))&&((card.rank == card3.rank ||[card1.suit isEqual:card3.suit]))&&((card3.rank == card2.rank ||[card3.suit isEqual:card2.suit])))
                            {
                                
                                one=YES;
                                break;
                            }
                        }
                    }
                }
                if(!one)
                {
                    [card1 setFaceUp:YES];
                    [card1 setUnplayable:YES];
                }
            }
        }
        
        
        
    }

}
@end
