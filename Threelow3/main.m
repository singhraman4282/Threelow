//
//  main.m
//  Threelow3
//
//  Created by Raman Singh on 2018-04-18.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Dice.h"
#import "gameState.h"
#import "scoreMaker.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        gameState *currentGameState = [gameState new];
        scoreMaker *newScoreMaker = [scoreMaker new];
        currentGameState.gameState = @"Step1";
        int currentScore = 0;
        int addToCurrentScore = 0;
        BOOL addingDice = false;
        
        Dice *dice1 = [Dice new];
        Dice *dice2 = [Dice new];
        Dice *dice3 = [Dice new];
        Dice *dice4 = [Dice new];
        Dice *dice5 = [Dice new];
        
        NSMutableArray *allDices = [NSMutableArray new];
        
        [allDices addObject:dice1];
        [allDices addObject:dice2];
        [allDices addObject:dice3];
        [allDices addObject:dice4];
        [allDices addObject:dice5];
        
        
        //        NSDictionary *heldDices = [NSDictionary new];
        NSMutableArray *heldDices = [NSMutableArray new];
        NSMutableArray *indexesOfHeldDice = [NSMutableArray new];
        
        while (YES) {
            
            heldDices = [NSMutableArray new];
            addingDice = true;
            
            if (allDices.count == 1) {
                Dice *thisDice = [allDices objectAtIndex:0];
                currentScore += [newScoreMaker diceValueTodiceScore:thisDice.currentValue];
                if (allDices.count == 0) {
                    NSLog(@"Game ended. Your score: %d", currentScore);
                    addingDice = false;
                    break;
                }//noDicesLeft
            }//ifOneDiceLeft
            
            if (allDices.count == 0) {
                NSLog(@"Game ended. Your score: %d", currentScore);
                addingDice = false;
                break;
            }//noDicesLeft
            
            
            
            
        
        InputHandler *newInput = [InputHandler new];
        NSLog(@"Type roll to play");
        
        
        
        
        
            if (allDices.count > 1) {
        
        
        if ([newInput.userInput isEqualToString:@"roll"]) {
            NSLog(@"User pressed roll");
            
            for (int i = 0; i < allDices.count; i ++) {
                Dice *thisDice = [allDices objectAtIndex:i];
                
                [[allDices objectAtIndex:i] randomize];
                [[allDices objectAtIndex:i] currentValue];
                
                NSLog(@"YO Dice %d is: %d", i + 1, [[allDices objectAtIndex:i] currentValue]);
            }//allDicesValue
        
            
            NSLog(@"Type yes to hold dice");
            newInput = [InputHandler new];
            
            
        }//if roll
        
        
        NSLog(@"Current score is: %d", currentScore);
        
        
        if ([newInput.userInput isEqualToString:@"yes"]) {
            NSLog(@"userChoseToHoldDie");
        }//currentGameState.gameState = @"Step2
        
        
        
        
        NSLog(@"Type the dice(s) you want to hold. If you hold one by mistake, type the dice number again to unhold it.");
        for (int i = 0; i < allDices.count; i ++) {
            Dice *thisDice = [allDices objectAtIndex:i];
            NSLog(@"Dice %d is: %d", i + 1, thisDice.currentValue);
        }//allDicesValue
        NSLog(@"write done when done holding");
        addingDice = true;
        
        while (addingDice) {
            newInput = [InputHandler new];
            NSString *userInput = newInput.userInput;
            if ([userInput isEqualToString:@"reset"]) {
                heldDices = [NSMutableArray new];
                NSLog(@"Reset dice");
            }//reset
            
//            newInput = [InputHandler new];
//            NSString *userInput = newInput.userInput;
            if ([userInput isEqualToString:@"done"]) {
                addingDice = false;
                if (allDices.count == 1) {
                    Dice *thisDice = [allDices objectAtIndex:0];
                    currentScore += [newScoreMaker diceValueTodiceScore:thisDice.currentValue];
                     NSLog(@"Game ended. Your score: %d", currentScore);
                    if (allDices.count == 0) {
                        NSLog(@"Game ended. Your score: %d", currentScore);
                        addingDice = false;
                        break;
                    }//noDicesLeft
                }//ifOneDiceLeft
                
               
               
                for (int i = 0; i < heldDices.count; i++) {
                    Dice *givenDice = [Dice new];
                    givenDice = [heldDices objectAtIndex:i];
                    [allDices removeObject:givenDice];
                    
                    
                    int givenDiceScore = givenDice.currentValue;
                    currentScore += [newScoreMaker diceValueTodiceScore:givenDice.currentValue];
                    
                    
//                    [newScoreMaker diceValueTodiceScore:givenDice.currentValue];
                    
                    
                }//addHeldDicesScore
                NSLog(@"Score so far: %d", currentScore);
                
            }//if done
            else {
                int heldDieIndex = [userInput intValue];
                
                if ([userInput intValue]) {
                    if (heldDieIndex < 6) {
                        if ([heldDices containsObject:[allDices objectAtIndex:heldDieIndex - 1]]) {
                            int indexofheldObject = [heldDices indexOfObject:[allDices objectAtIndex:heldDieIndex - 1]];
                            Dice *thisDice = [heldDices objectAtIndex:indexofheldObject];
                            [heldDices removeObject:thisDice];
                            NSLog(@"Removed Dice%d at index:", heldDieIndex);
                            NSLog(@"Total held dice is %lu", (unsigned long)heldDices.count);
                        }//if already there (unhold)
                        else {
                            
                        [heldDices addObject:[allDices objectAtIndex:heldDieIndex - 1]];
                        NSLog(@"Total held dice is %lu", (unsigned long)heldDices.count);
                        Dice *thisDice = [allDices objectAtIndex:heldDieIndex - 1];
                        [indexesOfHeldDice addObject:thisDice];
                        int thisDieFace = thisDice.currentValue;
                        NSLog(@"current score to be added: %d", [newScoreMaker diceValueTodiceScore:thisDieFace]);
                        }//if not held aready, hold!
                         }//if <6
                         else {
                             NSLog(@"Please enter a value between 1 to 5");
                         }//else
                         }//checkIfInt
                         }//else
                         }//while addingDice
        
                         
            }//if more than one dices available to roll
            else {
                NSLog(@"Game Over. Your current score is: %d", currentScore);
                break;
            }
                         
                         
                         
                         
                         
        }//bigWhile
                         
                         
                         
                         }//auto
                         
                         
                         
                         return 0;
                         }
