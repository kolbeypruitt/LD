//
//  DoctorEnterTool.h
//  邻医家
//
//  Created by Daniel on 15/6/3.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DoctorEnterParam,BaseResult;
#import <Foundation/Foundation.h>

@interface DoctorEnterTool : NSObject
+ (void)uploadDoctorDataWithParam:(DoctorEnterParam *)param
                    formDataArray:(NSArray *)formDataArray
                          success:(void (^)(BaseResult *result))success
                          failure:(void (^)(NSError *error))failure;
@end
