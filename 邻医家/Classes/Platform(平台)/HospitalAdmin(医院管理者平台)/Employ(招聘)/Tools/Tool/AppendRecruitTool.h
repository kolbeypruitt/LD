//
//  AppendRecruitTool.h
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class AppendRecruitParam,BaseResult;
#import <Foundation/Foundation.h>

@interface AppendRecruitTool : NSObject
+ (void)appendRecruitWithParam:(AppendRecruitParam *)param
                       success:(void (^)(BaseResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
