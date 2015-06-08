//
//  LoginTool.m
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AFNetworking.h"
#import "MJExtension.h"
#import "LoginTool.h"
#import "Common.h"
#import "SignUpParam.h"
#import "LoginResult.h"
@implementation LoginTool
+ (void)loginWithParam:(SignUpParam *)param success:(void (^)(LoginResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:LOGINURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        LoginResult *result = [LoginResult objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
@end
