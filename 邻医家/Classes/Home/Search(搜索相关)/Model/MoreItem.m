//
//  MoreItem.m
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MoreItem.h"

@implementation MoreItem
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destClass:(Class)destClass
{
    MoreItem *item = [self itemWithTitle:title icon:icon];
    item.destClass = destClass;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon
{
    MoreItem *item = [self item];
    item.icon = icon;
    item.title = title;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title icon:nil];
}
+ (instancetype)item
{
    return [[self alloc] init];
}
@end
