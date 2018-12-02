//
//  main.m
//  ObjectiveCFun
//
//  Created by Janusz Chudzynski on 12/1/18.
//  Copyright © 2018 izotx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArrayExtensions.h"




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSArray * array =  @[@1,@2,@4,@6];
        NSLog(@"%f",[array sum]);
    }
    return 0;
}


