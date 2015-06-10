//
//  ConsultDetailParam.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ConsultDetailParam.h"
@interface ConsultDetailParam ()
@property (nonatomic,assign) int id;
@end
@implementation ConsultDetailParam
+ (instancetype)paramWithId:(int)Id
{
    ConsultDetailParam *param = [[ConsultDetailParam alloc] init];
    param.id = Id;
    return param;
}
@end
