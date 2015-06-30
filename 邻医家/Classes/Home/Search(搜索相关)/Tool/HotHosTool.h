//
//  HotHosTool.h
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class SearchHosResult;
#import <Foundation/Foundation.h>

@interface HotHosTool : NSObject
+ (void)hotHosSuccess:(void (^)(SearchHosResult *result))success
              failure:(void (^)(NSError *error))failure;
@end
