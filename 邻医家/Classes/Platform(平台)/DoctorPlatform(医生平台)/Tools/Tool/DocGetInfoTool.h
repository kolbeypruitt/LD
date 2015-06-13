//
//  DocGetInfoTool.h
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DoctorConsultListParam,QueryConsultResult;
#import <Foundation/Foundation.h>

@interface DocGetInfoTool : NSObject
+ (void)getGCInfoListWithParam:(DoctorConsultListParam *)param
                       success:(void (^)(QueryConsultResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
