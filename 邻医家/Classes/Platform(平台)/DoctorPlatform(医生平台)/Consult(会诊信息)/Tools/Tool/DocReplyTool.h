//
//  DocReplyTool.h
//  邻医家
//
//  Created by Daniel on 15/7/28.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,BaseResult;
#import <Foundation/Foundation.h>

@interface DocReplyTool : NSObject
+ (void)replyConsultWithParam:(LDBaseParam *)param
                      success:(void (^)(BaseResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
