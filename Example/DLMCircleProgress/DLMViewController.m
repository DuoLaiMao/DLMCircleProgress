//
//  DLMViewController.m
//  DLMCircleProgress
//
//  Created by YangJian on 06/02/2018.
//  Copyright (c) 2018 YangJian. All rights reserved.
//

#import "DLMViewController.h"
#import <DLMCircleProgress/DLMCircleProgress.h>

@interface DLMViewController ()

@end

@implementation DLMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DLMCircleProgress *progress = [DLMCircleProgress circleProgressWithBarWidth:10];
    progress.frame = CGRectMake(50, 150, 100, 100);
    [progress setProgressBackgroundColor:[UIColor grayColor]];
    [progress setProgressColor:[UIColor redColor]];
    [progress updateProgress:0.0];
    [self.view addSubview:progress];
    
    __block CGFloat tmp = 0.f;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
        tmp += 0.05;
        [progress updateProgress:tmp];
        if (tmp > 1.0) {
            [timer invalidate];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
