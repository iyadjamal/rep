//
//  Card.h
//  Machismo
//
//  Created by Sam on 10/6/13.
//  Copyright (c) 2013 Sam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isFaceUp ) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;
- (int)match:(NSArray *)otherCards;

@end
