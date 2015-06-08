//
//  HospitalEnterTool.h
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDHttpTool,HospitalEnterParam,HospitalEnterResult;
#import <Foundation/Foundation.h>

@interface HospitalEnterTool : NSObject
+ (void)uploadHospitalDataWithParam:(HospitalEnterParam *)param
                      formDataArray:(NSArray *)formDataArray
                            success:(void (^)(HospitalEnterResult *result))success
                            failure:(void (^)(NSError *error))failure;
@end
