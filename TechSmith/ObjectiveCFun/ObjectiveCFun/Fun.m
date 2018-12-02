//
//  Fun.m
//  ObjectiveCFun
//
//  Created by Janusz Chudzynski on 12/1/18.
//  Copyright © 2018 izotx. All rights reserved.
//

#import "Fun.h"

@implementation Fun
-(int)reverseInt:(int)number{
    NSString * s = [NSString stringWithFormat:@"%d",number];
    NSMutableString * news = [NSMutableString new];
    for (unsigned long i = s.length - 1;i >=0; i--){
        //add to array
        NSString *s1 =  [s substringWithRange:NSMakeRange(i, 1)];
        [news appendString:s1];
    }
    
    return [news intValue];
}

-(BOOL)palindrome:(NSString *)word caseSensitive:(BOOL)caseSensitive {
    unsigned long leftIndex = 0;
    unsigned long rightIndex = word.length - 1;
    while (leftIndex<rightIndex){
        NSString * leftChar = [word substringWithRange:NSMakeRange(leftIndex, 1)];
        NSString * rightChar = [word substringWithRange:NSMakeRange(rightIndex, 1)];
        if(leftChar != rightChar){
            return false;
        }
        leftIndex ++;
        rightIndex --;
        
    }
    return true;
}


@end
