//
//  CaseDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "CaseDetailTool.h"
#import "CaseDetailResult.h"
#import "CaseDetailParam.h"
#import "Common.h"
#import "MJExtension.h"
#import "CaseDetail.h"
#import "LDHttpTool.h"
@implementation CaseDetailTool
+ (void)caseDetailWithParam:(CaseDetailParam *)param success:(void (^)(CaseDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:CASEDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            CaseDetailResult *result = [[CaseDetailResult alloc] init];
            result.Case = [CaseDetail objectWithKeyValues:json[@"case"]];
            result.status = json[@"status"];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
