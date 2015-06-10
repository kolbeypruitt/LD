//
//  PostConsultTool.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class PostConsultParam,BaseResult;
#import "LDHttpTool.h"
#import <Foundation/Foundation.h>

@interface PostConsultTool : NSObject
+ (void)postConsulWithParam:(PostConsultParam *)param
                    success:(void (^)(BaseResult *result))success
                    failure:(void (^)(NSError *error))failure;
@end
