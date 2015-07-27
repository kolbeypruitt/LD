//
//  PostLectureController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PostLectureController.h"
#import "Common.h"
#import "UILabel+LD.h"

@interface PostLectureController ()

@end

@implementation PostLectureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.title = @"发布讲座信息";
   
    UILabel *messageLabel = [UILabel labelWithTitle:@"暂未开通,敬请期待!" font:16 textColor:[UIColor blackColor]];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.frame = self.view.bounds;
    [self.view addSubview:messageLabel];
}
@end
