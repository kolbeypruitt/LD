//
//  GroupViewController.m
//  邻医家
//
//  Created by Daniel on 15/7/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "GroupViewController.h"
#import "Common.h"
#import "UILabel+LD.h"
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
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *messageLabel = [UILabel labelWithTitle:@"暂未开通,敬请期待!" font:17 textColor:IWColor(88, 202, 203)];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.frame = self.view.bounds;
    [self.view addSubview:messageLabel];
}
@end
