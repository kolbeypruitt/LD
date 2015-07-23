//
//  ChangeArrangeTool.h
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDArrangementParam,BaseResult;
#import <Foundation/Foundation.h>

@interface ChangeArrangeTool : NSObject
+ (void)changeArrangeWithParam:(LDArrangementParam *)param
                       success:(void (^)(BaseResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
