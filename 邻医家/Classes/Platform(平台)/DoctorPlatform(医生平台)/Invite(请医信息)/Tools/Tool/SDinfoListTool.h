//
//  SDinfoListTool.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,InfoListResult;
#import <Foundation/Foundation.h>

@interface SDinfoListTool : NSObject
+ (void)getSDInfoListWithParam:(LDBaseParam *)param
                       success:(void (^)(InfoListResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
