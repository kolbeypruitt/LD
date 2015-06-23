//
//  HotAreaTool.h
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HotAreaResult;
@interface HotAreaTool : NSObject
+ (void)hotAreaSuccess:(void (^)(HotAreaResult *result))success failure:(void (^)(NSError *error))failure;
@end
