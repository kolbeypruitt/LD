//
//  ReplyInviteTool.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class FreeDetailMsgParam,BaseResult;
#import <Foundation/Foundation.h>

@interface ReplyInviteTool : NSObject
+ (void)replyInviteMsgWithParam:(FreeDetailMsgParam *)param
                        success:(void (^)(BaseResult *result))success
                        failure:(void (^)(NSError *error))failure;
@end
