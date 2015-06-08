//
//  DocSearchParam.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DocSearchParam.h"

@implementation DocSearchParam
+ (DocSearchParam *)docSearchParamWithCities:(NSString *)cities department:(NSString *)department docName:(NSString *)docName
{
    DocSearchParam *param = [[self alloc] init];
    param.cities = cities;
    param.department = department;
    param.name = docName;
    return param;
}
@end
