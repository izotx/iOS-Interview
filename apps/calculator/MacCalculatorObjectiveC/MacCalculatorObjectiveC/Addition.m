//
//  Addition.m
//  MacCalculatorObjectiveC
//
//  Created by Janusz Chudzynski on 12/2/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import "Addition.h"
#import "OperationResult.h"

@implementation Addition

@synthesize firstNumber;
@synthesize secondNumber;
@synthesize operatorName;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.operatorName = @"+";
    }
    return self;
}

- (nonnull OperationResult *)getResult {
    OperationResult * result = [OperationResult new];
    result.value = self.firstNumber + self.secondNumber;
    result.error = NO;
    result.message = nil;
    
    return result;
}

- (void)setFirstNumber:(int)number {
    self.firstNumber = number;
}

- (void)setSecondNumber:(int)number {
    self.secondNumber = number;
}


@end
