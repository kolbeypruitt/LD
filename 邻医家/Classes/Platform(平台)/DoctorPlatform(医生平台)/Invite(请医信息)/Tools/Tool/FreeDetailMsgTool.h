//
//  FreeDetailMsgTool.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class FreeMsgResult,FreeDetailMsgParam;
#import <Foundation/Foundation.h>

@interface FreeDetailMsgTool : NSObject
+ (void)getSDInfoWithParam:(FreeDetailMsgParam *)param
                           success:(void (^)(FreeMsgResult *result))success
                           failure:(void (^)(NSError *error))failure;
@end
