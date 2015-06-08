//
//  SearchDoctorTool.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SearchDoctorTool.h"
#import "LDHttpTool.h"
#import "SearchDoctorParam.h"
#import "SearchDoctorResult.h"
#import "MJExtension.h"
#import "Common.h"
@implementation SearchDoctorTool
+ (void)searchDoctorWithParam:(SearchDoctorParam *)param success:(void (^)(SearchDoctorResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DOCSEARCHURL params:param.keyValues success:^(id json) {
        SearchDoctorResult *result = [SearchDoctorResult objectWithKeyValues:json];
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
