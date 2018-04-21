//
//  InputHandler.m
//  Threelow3
//
//  Created by Raman Singh on 2018-04-18.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler
-(NSString *)userInput {
    char ui[255];
    fgets(ui, 255, stdin);
    NSString *input = [NSString stringWithUTF8String:ui];
    input = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return input;
}
@end
