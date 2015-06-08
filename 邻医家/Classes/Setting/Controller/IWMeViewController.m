//
//  IWMeViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWMeViewController.h"
#import "IWSettingArrowItem.h"
#import "IWSettingGroup.h"
#import "LDHomeHeadView.h"
@interface IWMeViewController ()
@property (nonatomic,weak) LDHomeHeadView *headerView;
@end

@implementation IWMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setHeadView];

    [self setupGroup0];
}
- (void)setHeadView
{
    LDHomeHeadView *headview = [[LDHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self.tableView setTableHeaderView:headview];
    self.headerView = headview;
}
- (void)setupGroup0
{
    IWSettingGroup *group = [self addGroup];
    
    IWSettingArrowItem *user = [IWSettingArrowItem itemWithIcon:nil title:@"用户名" destVcClass:nil];
    IWSettingArrowItem *introduce = [IWSettingArrowItem itemWithIcon:nil title:@"邻医家介绍" destVcClass:nil];
    IWSettingArrowItem *version = [IWSettingArrowItem itemWithIcon:nil title:@"版本信息" destVcClass:nil];
    group.items  = @[user,introduce,version];
}




@end
