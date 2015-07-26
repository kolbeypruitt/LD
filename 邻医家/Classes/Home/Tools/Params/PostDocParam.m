//
//  PostDocParam.m
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostDocParam.h"

@implementation PostDocParam
+ (instancetype)paramWithDirection:(NSString *)researchDirection
{
    PostDocParam *param = [[PostDocParam alloc] init];
    param.researchDirection = researchDirection;
    return param;
}
@end
