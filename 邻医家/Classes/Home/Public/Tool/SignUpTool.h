//
//  SignUpTool.h
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SignUpParam,SignUpResult;
@interface SignUpTool : NSObject
+ (void)signUpWithParam:(SignUpParam *)param success:(void (^)(SignUpResult *result))success failure:(void (^)(NSError *error))failure;
+ (void)getCheckInWithTelnum:(NSString *)telnum success:(void (^)())success failure:(void   (^)(NSError *error))failure;
@end
