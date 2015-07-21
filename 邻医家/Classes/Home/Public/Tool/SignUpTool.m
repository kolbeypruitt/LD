//
//  SignUpTool.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SignUpTool.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "BaseResult.h"
#import "SignUpParam.h"
#import "SignUpResult.h"
#import "Common.h"
#import "LDHttpTool.h"
@implementation SignUpTool
+ (void)signUpWithParam:(SignUpParam *)param success:(void (^)(SignUpResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:SIGNUPURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SignUpResult *result = [SignUpResult objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)getCheckInWithTelnum:(NSString *)telnum success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"telnum"] = telnum;
    [LDHttpTool getWithURL:GETCHECKINURL params:param success:^(id json) {
        if (success) {
            BaseResult *result = [BaseResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)chekWithTelnum:(NSString *)telnum success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"telnum"] = telnum;
    [LDHttpTool getWithURL:GETCHECKINURL params:param success:^(id json) {
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
