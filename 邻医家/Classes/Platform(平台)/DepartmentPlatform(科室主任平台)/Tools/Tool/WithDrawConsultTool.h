//
//  WithDrawConsultTool.h
//  邻医家
//
//  Created by SXQ on 15/6/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class BaseResult,ConsultDetailParam;
#import <Foundation/Foundation.h>

@interface WithDrawConsultTool : NSObject
+ (void)withDrawConsultWithParam:(ConsultDetailParam *)param
                         success:(void (^)(BaseResult *result))success
                         failure:(void (^)(NSError *error))failure;
@end
