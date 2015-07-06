//
//  GroupViewController.m
//  邻医家
//
//  Created by Daniel on 15/7/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "GroupViewController.h"
#import "Common.h"
@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"团请医生";
//    self.view.window.backgroundColor = BGCOLOR;
    self.view.backgroundColor = BGCOLOR;
}
@end
