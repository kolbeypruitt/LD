//
//  AppendRecruitController.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "MBProgressHUD+MJ.h"
#import "AppendRecruitView.h"
#import "AppendRecruitController.h"
#import "UIBarButtonItem+ENTER.h"
#import "AppendRecruitTool.h"
#import "BaseResult.h"
#import "AppendRecruitParam.h"
@interface AppendRecruitController ()
@property (nonatomic,weak) AppendRecruitView *appendView;
@end

@implementation AppendRecruitController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = BGCOLOR;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(postRecruit) title:@"发布"];
    self.title = @"创建招聘";
    [self addCustomViews];
}
#pragma mark - 添加子控件
- (void)addCustomViews
{
    AppendRecruitView *appendView = [[AppendRecruitView alloc] initWithFrame:self.view.bounds];
    _appendView = appendView;
    [self.view addSubview:appendView];
}
#pragma mark - 发布招聘

- (void)postRecruit
{
    AppendRecruitParam *param = [_appendView fillParam];
    [AppendRecruitTool appendRecruitWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:@"发布失败!"];
        }
        
    } failure:^(NSError *error) {
            [MBProgressHUD showError:@"发布失败!"];
    }];
}
@end
