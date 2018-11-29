//
//  ViewController.m
//  DelegateObjectiveC
//
//  Created by Janusz Chudzynski on 11/26/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import "ViewController.h"
#import "TapProtocol.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)tapTap:(id)sender {
    [self.delegate buttonTapped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonTapped:(id)sender {
    [self.delegate buttonTapped];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
