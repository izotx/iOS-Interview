//
//  ViewController.h
//  ObjectiveC
//
//  Created by Janusz Chudzynski on 11/25/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyProtocol <NSObject>
- (NSUInteger)numberOfSegmentsInFile;
@end

@interface ViewController : UIViewController <MyProtocol>


@end

