//
//  SimpleCalculator.m
//  MacCalculatorObjectiveC
//
//  Created by Janusz Chudzynski on 11/29/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import "SimpleCalculator.h"


@interface SimpleCalculator()
    @property NSString * lastOperation;
    @property NSMutableString * firstNumber;
    @property NSMutableString * secondNumber;
    @property BOOL firstNumberCompleted;
    @property BOOL secondNumberCompleted;

    @property NSMutableArray * operations;
    @property NSArray * commands;
    @property NSArray * digits;
    @property NSString * displayText;

@end

@implementation SimpleCalculator
- (instancetype)init
{
    self = [super init];
    if (self) {
        _commands = @[@"*",@"/",@"+",@"-",@"=",@"C"];
        NSMutableArray * tempDigits = [NSMutableArray new];
        _secondNumber = [NSMutableString new];
        _firstNumber = [NSMutableString new];
        
        for (int i = 0; i< 10; i++){
            [tempDigits addObject:[NSString stringWithFormat:@"%d",i]];
        }
        _digits = tempDigits;
    }
    return self;
}

    -(void)addExpression:(NSString*)input{
        if([_digits containsObject:input]){
            if (!_firstNumberCompleted){
                [_firstNumber  appendString:input];
            }
            else{
                [_secondNumber appendString:input];
            }
        }
        else  if([_commands containsObject:input]){
            //evaluate commands
        }
    }

    -(void)evaluateCommand:(NSString *)command{
        if([command isEqualToString:@"C"]){
            [self clearInput];
        }
        else if([command isEqualToString:@"="]){
            //Evaluate expression
            [self calculate:self.lastOperation first:self.firstNumber andSecond:self.secondNumber];
        }
        else{
            _lastOperation = command;
        }
    }


-(NSString*)calculate:(NSString *)operation first:(NSString*)first andSecond:(NSString*)second{
    int firstNumber = (first != nil)? first.intValue : 0;
    int secondNumber = (first != nil)? first.intValue : 0;
    
    return [NSString stringWithFormat:@"%d",(firstNumber + secondNumber)];
}

-(void)add:(int) first second:(int)second{
    return ()
}

-(void)clearInput{
    _secondNumber = [NSMutableString new];
    _firstNumber = [NSMutableString new];
    _firstNumberCompleted = false;
    _secondNumberCompleted = false;
    _lastOperation = nil;
}

@end
