//
//  History ControllerViewController.m
//  cardgame
//
//  Created by Student on 4/20/17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "History ControllerViewController.h"

@interface History_ControllerViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txvHistory;

@end

@implementation History_ControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txvHistory.text=@"History";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    NSUserDefaults *db=[NSUserDefaults standardUserDefaults];
    NSArray *a=[db objectForKey:@"game history"];
    NSMutableString *s= [[NSMutableString alloc] init];
    for(int i=0;i<[a count];i++)
    {
        [s appendString:a[i]];
        [s appendString:@"\n"];
    }
    self.txvHistory.text=s;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
