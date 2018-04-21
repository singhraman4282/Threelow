//
//  Dice.m
//  Threelow3
//
//  Created by Raman Singh on 2018-04-18.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(int)randomize {
    int returnedValue = arc4random_uniform(6) + 1;
    self.currentValue = returnedValue;
    return returnedValue;
}
@end
