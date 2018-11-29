//
//  ViewController.h
//  DelegateObjectiveC
//
//  Created by Janusz Chudzynski on 11/26/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TapProtocol;

@interface ViewController : UIViewController
@property (weak, nonatomic) id<TapProtocol> delegate;

@end

