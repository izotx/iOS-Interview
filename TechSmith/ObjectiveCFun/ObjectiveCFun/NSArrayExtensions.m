//
//  NSArrayExtensions.m
//  ObjectiveCFun
//
//  Created by Janusz Chudzynski on 12/1/18.
//  Copyright © 2018 izotx. All rights reserved.
//

#import "NSArrayExtensions.h"

@implementation NSArray(Extensions)

-(float)sum{
   __block float sum = 0;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        sum += [obj floatValue];
    }];
    
    return sum;
}

-(NSArray*)evenOdd{
    NSMutableArray * even = [NSMutableArray new];
    NSMutableArray * odd = [NSMutableArray new];
    for( id object in self){
        int val = [object intValue];
        if (val % 2  == 0){
            [even addObject:[NSNumber numberWithInt:val]];
        }
    }
    
    return @[even,odd];
}




@end

@implementation NSArrayExtensions

@end
