//
//  IWMeViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
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
#import "UIButton+LD.h"
@interface IWMeViewController ()
@property (nonatomic,weak) UIButton *logoutBtn;
@end

@implementation IWMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    [self setupGroup0];
}
- (void)setup
{
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 40, 0);
    UIButton *logoutBtn = [UIButton buttonWithTitle:@"退出登录" font:14 titleColor:[UIColor whiteColor] target:self action:@selector(logout)];
    logoutBtn.backgroundColor = [UIColor redColor];
    logoutBtn.frame = CGRectMake(0, 0, SCREENWIDTH - 200, 35);
    self.logoutBtn = logoutBtn;
    self.tableView.tableFooterView = logoutBtn;
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
    IWSettingLabelItem *telNum = [IWSettingLabelItem itemWithTitle:@"手机号" Subtitle:@"13288888888"];
    IWSettingLabelItem *name = [IWSettingLabelItem itemWithTitle:@"真实姓名" Subtitle:@"郑学胜"];
    IWSettingLabelItem *idcard = [IWSettingLabelItem itemWithTitle:@"身份证号"  Subtitle:@"430821199103040303"];
    
    IWSettingLabelItem *hospital = [IWSettingLabelItem itemWithTitle:@"医院名称"  Subtitle:@"上海医院"];
    IWSettingLabelItem *location = [IWSettingLabelItem itemWithTitle:@"当地地区"  Subtitle:@"徐汇区"];
    IWSettingLabelItem *address = [IWSettingLabelItem itemWithTitle:@"医院地址"  Subtitle:@"肇嘉浜"];
    IWSettingLabelItem *level = [IWSettingLabelItem itemWithTitle:@"医院等级"  Subtitle:@"公立医院"];
    IWSettingLabelItem *department = [IWSettingLabelItem itemWithTitle:@"科室"  Subtitle:@"内科"];
    IWSettingLabelItem *jobType = [IWSettingLabelItem itemWithTitle:@"临床职称"  Subtitle:@"医生"];
    IWSettingLabelItem *goodAt  = [IWSettingLabelItem itemWithTitle:@"擅长疾病"  Subtitle:@"胃病"];
    IWSettingLabelItem *jobnum  = [IWSettingLabelItem itemWithTitle:@"执业号"  Subtitle:@"123456"];
    IWSettingArrowItem *passwd  = [IWSettingArrowItem itemWithIcon:nil title:@"修改密码" destVcClass:nil];
    
    
    group.items  = @[telNum,name,idcard,hospital,location,address,level,department,jobType,goodAt,jobnum,passwd];
}



@end
