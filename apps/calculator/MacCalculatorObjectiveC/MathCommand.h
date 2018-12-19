//
//  MathCommand.h
//  MacCalculatorObjectiveC
//
//  Created by Janusz Chudzynski on 12/2/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OperationResult;

NS_ASSUME_NONNULL_BEGIN

@protocol MathCommand <NSObject>
@property NSString * operatorName;
@property int firstNumber;
@property int secondNumber;

-(void)setFirstNumber:(int)number;
-(void)setSecondNumber:(int)number;
-(OperationResult*)getResult;

@end

NS_ASSUME_NONNULL_END
