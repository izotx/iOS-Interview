//
//  Calculator.m
//  MacCalculatorObjectiveC
//
//  Created by Janusz Chudzynski on 11/29/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
// Simplify it.
// Equal sign

#import "Calculator.h"
@interface Calculator()
    @property NSMutableArray * operations;
    @property NSArray * commands;
    @property NSArray * digits;

@end

@implementation Calculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _commands = @[@"*",@"/",@"+",@"-",@"=",@"C"];
        NSMutableArray * tempDigits = [NSMutableArray new];
        for (int i = 0; i< 10; i++){
            [tempDigits addObject:[NSString stringWithFormat:@"%d",i]];
        }
        _digits = tempDigits;
    }
    return self;
}

-(BOOL)addOperation:(NSString *)userInput{
    //Check if it is valid operation
    if([_commands containsObject:userInput]){
        //evaluate commands
        [_operations addObject:userInput];
        
        return true;
    }
    else if([_digits containsObject:userInput]){
        //Further validation is needed, there will be different cases
        [_operations addObject:userInput];
        return true;
    }else{//Invalid Object Detected
        return false;
    }
}

-(void)addDigit:(NSString *) userInput{
    
}

-(void)calculate{
    
}

-(void)clear{
    
}

-(void)evaluateCommand:(NSString *)command{
    if([command isEqualToString:@""]){
        
    }
}



//divide into operations
//it should be number, operation, number


-(NSArray*)parseNumbers{
    NSMutableString * currentNumber = [NSMutableString new];
    NSMutableArray * parsedNumbers = [NSMutableArray new];
    
    for (NSString * input in _operations){
        if([_digits containsObject:input]){
            [currentNumber appendString:input];
        }
        else{

            if (currentNumber.length > 1){
                [parsedNumbers addObject: [NSNumber numberWithInt:currentNumber.intValue]];
                [currentNumber deleteCharactersInRange:NSMakeRange(0, currentNumber.length - 1)];
            }
            [parsedNumbers addObject:input];
        }
    }
    return parsedNumbers;
}
// 1
// 1 +
// 1 +/
// 1 +/ 3

-(void)addCommand:(NSString *)userInput{
    if([userInput isEqualToString:@"="]){
        //Evaluate expression and return to the user
        [self calculate];
    }
    else if([userInput isEqualToString:@"C"]){
        //Evaluate expression and return to the user
        [self clear];
    }
}



@end
