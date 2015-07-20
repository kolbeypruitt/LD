//
//  IWMeViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
#import "LDAboutViewController.h"
#import "IWNavigationController.h"
#import "PublicHomeController.h"
#import "IWMeViewController.h"
#import "AccountTool.h"
#import "Common.h"
#import "IWSettingArrowItem.h"
#import "IWSettingGroup.h"
#import "LDHomeHeadView.h"
#import "IWSettingLabelItem.h"
#import "AccountTool.h"
#import "Account.h"
#import "LDBaseParam.h"
#import "UIButton+LD.h"
#import "UserTool.h"
#import "LDUser.h"
#import "UserResult.h"
@interface IWMeViewController ()
@property (nonatomic,weak) UIButton *logoutBtn;
@property (nonatomic,strong) LDUser *user;
@end

@implementation IWMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    [self setupGroup0];
    [self loadUserData];
}
- (void)loadUserData
{
    LDBaseParam *param = [LDBaseParam param];
    [UserTool userWithParam:param success:^(UserResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.user = result.account;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 40, 0);
    UIButton *logoutBtn = [UIButton buttonWithTitle:@"退出登录" font:14 titleColor:[UIColor whiteColor] target:self action:@selector(logout)];
    logoutBtn.backgroundColor = IWColor(88, 202, 203);
    logoutBtn.frame = CGRectMake(0, 0, SCREENWIDTH - 200, 35);
    self.logoutBtn = logoutBtn;
    self.tableView.tableFooterView = logoutBtn;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.user.telnum = @"ddddd";
    });
}
- (void)logout
{
    if ([AccountTool deleteAccount]) {
        PublicHomeController *publicHome = [[PublicHomeController alloc] init];
        IWNavigationController *nav = [[IWNavigationController alloc] initWithRootViewController:publicHome];
        self.view.window.rootViewController = nav;
    }
}
- (void)setupGroup0
{
    
    IWSettingGroup *group = [self addGroup];
    IWSettingLabelItem *telnum = [IWSettingLabelItem itemWithTitle:@"手机号" Subtitle:self.user.telnum];
    IWSettingArrowItem *about = [IWSettingArrowItem itemWithTitle:@"关于邻医家" destVcClass:[LDAboutViewController class]];
    
    group.items  = @[telnum,about];
}
- (void)setUser:(LDUser *)user
{
    _user = user;
    IWSettingLabelItem *item = [[self.groups[0] items] firstObject];
    item.subtitle = user.telnum;
}


@end
