//
//  PlayingCard.h
//  Machismo
//
//  Created by Sam on 10/6/13.
//  Copyright (c) 2013 Sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

