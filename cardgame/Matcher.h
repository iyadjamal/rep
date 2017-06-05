//
//  Matcher.h
//  cardgame
//
//  Created by Student on 3/28/17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Matcher : NSObject
@property (nonatomic) BOOL Mode3or2;
@property (nonatomic) NSInteger Score;//read only prevent any class from set it by the setter (make getter only )
@property (nonatomic) NSMutableArray *cards;
@property (nonatomic) BOOL match;
-(id)initWithCardNumber:(NSUInteger)cardNum;
-(void)cardFlipped:(NSUInteger)index;

@end
