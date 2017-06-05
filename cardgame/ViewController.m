//
//  ViewController.m
//  cardgame
//
//  Created by Student on 3/16/17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ViewController.h"
#import "Matcher.h"
#import "PlayingCard.h"
@interface ViewController ()
@property(nonatomic) BOOL bOn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UILabel *lblLastCard;
@property (nonatomic) Matcher* matcher;
@property (weak, nonatomic) IBOutlet UISwitch *GameMode;
@property (weak, nonatomic) IBOutlet UILabel *lblGameMode;

@property (nonatomic) NSMutableArray* history;
@end

@implementation ViewController
- (IBAction)on_Click:(id)sender
{
    NSString*oldscore=@"";
    UIButton *b =(UIButton*)sender;
    oldscore=self.lblScore.text;
    NSUInteger index = [self.cards indexOfObject:b];
    self.GameMode.enabled=false;
    
    [self.matcher cardFlipped:index];
    NSString *s=[NSString stringWithFormat:@"Score : %ld",self.matcher.Score];
    if(![s isEqualToString:oldscore])
     
    [self.history addObject:s];
    self.lblScore.text=s;
    for(int i=0;i<self.matcher.cards.count;i++)
    {
        PlayingCard *c=self.matcher.cards[i];
        
        UIButton *b =self.cards[i];
        if(!c.isFaceUp)
        {
            
            b.backgroundColor=[UIColor redColor];
            b.selected=NO;
        }
        else
        {
            if(self.matcher.match)
                b.alpha=0.5;
            b.backgroundColor=[UIColor whiteColor];
            b.selected=YES;
        }
    }
    
     PlayingCard *c=self.matcher.cards[index];
    self.lblLastCard.text=c.contents;
}
-(void) newGame
{
    
    self.GameMode.enabled=true;
    self.history=[[NSMutableArray alloc] init];
    NSUInteger cardNum=[self.cards count];
    self.matcher= [[Matcher alloc]initWithCardNumber:cardNum];
    for(int i=0;i<self.matcher.cards.count;i++)
    {
        PlayingCard *c=self.matcher.cards[i];
        UIButton *b =self.cards[i];
        b.alpha=1;
        b.selected=NO;
        b.backgroundColor=[UIColor redColor];
        NSString *s=c.contents;
        [b setTitle:s forState: UIControlStateSelected];
    }
    self.lblLastCard.text=@"";
    self.lblScore.text=@"Score : 0";
}
- (IBAction)redeal:(id)sender {
    [self newGame];
    
}
- (IBAction)switched:(id)sender {
    UISwitch *sw=(UISwitch*)sender;
    sw.selected=!sw.selected;
    if(sw.selected)
    {
        self.lblGameMode.text=@"3 Card Mode";
        self.matcher.Mode3or2=NO;
    }
    else
    {
        self.lblGameMode.text=@"2 Card Mode";
        self.matcher.Mode3or2=YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newGame];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillDisappear:(BOOL)animated
{
    NSUserDefaults *db=[NSUserDefaults standardUserDefaults];
    [db setObject:self.history forKey:@"game history"];
}


@end
