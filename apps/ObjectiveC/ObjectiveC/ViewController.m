//
//  ViewController.m
//  ObjectiveC
//
//  Created by Janusz Chudzynski on 11/25/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
    @property (nonatomic,retain) NSString * testString;
//    @property (weak) id <MyProtocol> dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@" %s %@ ", __PRETTY_FUNCTION__, self.testString);
    [self.view addSubview:[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)]];
    if ( [self respondsToSelector:@selector(viewDidAppear:)]){
        NSLog(@"Test ");
    }
}

-(int)returnString:(NSString *)a and: (int) k{
    
    return k;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated{
    NSLog(@" %s ", __PRETTY_FUNCTION__);
}



- (NSUInteger)numberOfSegmentsInFile {
    //Implented delegate method
    return 1;
}
@end
