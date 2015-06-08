//
//  PatientEnterTool.h
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDHttpTool,PatientEnterParam,BaseResult;
#import <Foundation/Foundation.h>

@interface PatientEnterTool : NSObject
+ (void)uploadPatientDataWithParam:(PatientEnterParam *)param
                     formDataArray:(NSArray *)formDataArray
                           success:(void (^)(BaseResult *result))success
                           failure:(void (^)(NSError *error))failure;
@end
