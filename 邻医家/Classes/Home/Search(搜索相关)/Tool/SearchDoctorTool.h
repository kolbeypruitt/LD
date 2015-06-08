//
//  SearchDoctorTool.h
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class SearchDoctorParam,SearchDoctorResult;
#import <Foundation/Foundation.h>
@interface SearchDoctorTool : NSObject
+ (void)searchDoctorWithParam:(SearchDoctorParam *)param
                      success:(void (^)(SearchDoctorResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
