//
//  PostArrangeTool.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DocArrangementParam,BaseResult;
#import <Foundation/Foundation.h>

@interface PostArrangeTool : NSObject
+ (void)postArrangeWithParam:(DocArrangementParam *)param
                     success:(void (^)(BaseResult *result))success
                     failure:(void (^)(NSError *erro))failure;
@end
