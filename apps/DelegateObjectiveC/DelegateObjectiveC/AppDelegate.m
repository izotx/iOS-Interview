//
//  AppDelegate.m
//  DelegateObjectiveC
//
//  Created by Janusz Chudzynski on 11/26/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController * vc =  (ViewController *)[[[[UIApplication sharedApplication] delegate]window] rootViewController];
    vc.delegate = self;
    return YES;
}

#pragma mark Delegate methods
- (void)buttonTapped{
    NSLog(@"Button Tapped Here");
}
@end
