//
//  SignUpParam.m
//  邻医家
//
//  Created by Daniel on 15/4/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SignUpParam.h"
@implementation SignUpParam
+ (SignUpParam *)paramWithTel:(NSString *)tel code:(NSString *)code passwd:(NSString *)passwd
{
    SignUpParam *param  = [[SignUpParam alloc] init];
    param.telnum = tel;
    param.code = code;
    param.password = passwd;
    return param;
}
@end
