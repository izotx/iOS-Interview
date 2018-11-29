//
//  AppDelegate.h
//  DelegateObjectiveC
//
//  Created by Janusz Chudzynski on 11/26/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapProtocol.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, TapProtocol>
@property (strong, nonatomic) UIWindow *window;
@end

