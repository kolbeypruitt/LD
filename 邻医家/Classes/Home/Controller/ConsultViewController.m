//
//  ConsultViewController.m
//  邻医家
//
//  Created by Daniel on 15/4/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ConsultViewController.h"
#import "IWSettingGroup.h"
#import "IWSettingArrowItem.h"
@interface ConsultViewController ()

@end

@implementation ConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会诊信息";
    [self setgroup1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setgroup1
{
    IWSettingGroup *group = [self addGroup];
    group.header = @"会诊信息";
    IWSettingItem *item1 = [IWSettingItem itemWithIcon:nil title:@"会诊信息1"];
    IWSettingItem *item2 = [IWSettingItem itemWithIcon:nil title:@"会诊信息2"];
    IWSettingItem *item3 = [IWSettingItem itemWithIcon:nil title:@"会诊信息3"];
    IWSettingItem *item4 = [IWSettingItem itemWithIcon:nil title:@"会诊信息4"];
    group.items = @[item1,item2,item3,item4];
}
@end
