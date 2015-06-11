//
//  ReviewController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ReviewController.h"
#import "UIBarButtonItem+ENTER.h"
#import "PublicHomeController.h"
#import "IWNavigationController.h"
#import "HospitalAdminController.h"
#import "IWMeViewController.h"
@interface ReviewController ()

@end

@implementation ReviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"审核状态";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(backup) title:@"返回"];
}
- (void)backup
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
