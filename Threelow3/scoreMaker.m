//
//  scoreMaker.m
//  Threelow3
//
//  Created by Raman Singh on 2018-04-18.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "scoreMaker.h"

@implementation scoreMaker
-(int)diceValueTodiceScore:(int)given {
    if (given == 3) {
        return 0;
    }
    else {
        return given;
    }
}
@end
