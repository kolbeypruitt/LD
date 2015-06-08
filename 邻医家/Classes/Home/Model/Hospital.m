//
//  Hospital.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "Hospital.h"

@implementation Hospital
+ (instancetype)hospitalWithName:(NSString *)name detail:(NSString *)detail
{
    Hospital *hos = [[Hospital alloc] init];
    hos.name = name;
    hos.detail = detail;
    return  hos;
}
@end
