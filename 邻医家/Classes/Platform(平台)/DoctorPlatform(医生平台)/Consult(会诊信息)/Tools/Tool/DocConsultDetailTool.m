//
//  DocConsultDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "DocConsultDetailParam.h"
#import "DocConsultDetailTool.h"
#import "MJExtension.h"
#import "Common.h"
@implementation DocConsultDetailTool
+ (void)getDocConsultDetailWithParam:(DocConsultDetailParam *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DOCCONSULTDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
