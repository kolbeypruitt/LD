//
//  IWSettingLabelItem.m
//  示例-ItcastWeibo
//
//  Created by MJ Lee on 14-5-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWSettingLabelItem.h"

@implementation IWSettingLabelItem
+ (instancetype)itemWithTitle:(NSString *)title Subtitle:(NSString *)sutitle
{
    IWSettingLabelItem *item = [IWSettingLabelItem itemWithTitle:title];
    item.subtitle = sutitle;
    return item;
}
@end
