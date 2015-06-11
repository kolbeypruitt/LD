//
//  PostCaseViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostCaseViewController.h"
#import "Common.h"
@interface PostCaseViewController ()

@end

@implementation PostCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.title = @"发布病例";
}
@end
