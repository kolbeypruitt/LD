//
//  IWSettingItem.m
//  ItcastWeibo
//
//  Created by apple on 14-5-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWSettingItem.h"

@implementation IWSettingItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    IWSettingItem *item = [self item];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}

+ (instancetype)item
{
    return [[self alloc] init];
}
@end
