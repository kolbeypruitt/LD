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
#import "SignUpParam.h"
#import "SignUpResult.h"
#import "Common.h"
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
+ (void)getCheckInWithTelnum:(NSString *)telnum success:(void (^)())success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"telnum"] = telnum;
    [manager GET:GETCHECKINURL parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success();
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
@end
