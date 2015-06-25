//
//  LDSettingController.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDSettingController.h"
#import "Common.h"
@interface LDSettingController ()
@end

@implementation LDSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = IWColor(226, 226, 226);
}

@end
