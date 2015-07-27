//
//  LoginDocDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,LoginDocDetailResult;
#import <Foundation/Foundation.h>

@interface LoginDocDetailTool : NSObject
+ (void)loginDocdetailWithParam:(LDBaseParam *)param
                            url:(NSString *)url
                        success:(void (^)(LoginDocDetailResult *result))success
                        failure:(void (^)(NSError *errror))failure;
@end
