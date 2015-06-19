//
//  ConsultDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ConsultDetailParam,ConsutlDetailResult;
#import <Foundation/Foundation.h>

@interface ConsultDetailTool : NSObject
+ (void)consultDetailWithParam:(ConsultDetailParam *)param
                       success:(void (^)(ConsutlDetailResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
