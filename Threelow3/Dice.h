//
//  Dice.h
//  Threelow3
//
//  Created by Raman Singh on 2018-04-18.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject
@property (nonatomic) int currentValue;
-(int)randomize;
@end
