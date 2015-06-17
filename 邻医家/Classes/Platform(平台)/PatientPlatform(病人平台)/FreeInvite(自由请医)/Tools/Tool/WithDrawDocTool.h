//
//  WithDrawDocTool.h
//  邻医家
//
//  Created by Daniel on 15/6/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class AllInviteParam,BaseResult;
#import <Foundation/Foundation.h>

@interface WithDrawDocTool : NSObject
+ (void)withDrawDocWithParam:(AllInviteParam *)param
                     success:(void (^)(BaseResult *result))success
                     failure:(void (^)(NSError *error))failure;
@end
