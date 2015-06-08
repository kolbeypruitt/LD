//
//  HomeGroup.m
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HomeGroup.h"

@implementation HomeGroup
+ (HomeGroup *)group
{
    return [[HomeGroup alloc] init];
}
+ (HomeGroup *)groupWithHeader:(NSString *)header footer:(NSString *)footer datas:(NSArray *)datas dataType:(CellDataType)type
{
    HomeGroup *group = [HomeGroup group];
    group.header = header;
    group.footer = footer;
    group.datas = datas;
    group.type = type;
    return group;
}
@end
