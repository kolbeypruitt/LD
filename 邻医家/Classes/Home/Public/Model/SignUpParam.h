//
//  SignUpParam.h
//  邻医家
//
//  Created by Daniel on 15/4/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpParam : NSObject
@property (nonatomic,copy) NSString *telnum;
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *password;
+ (SignUpParam *)paramWithTel:(NSString *)tel code:(NSString *)code passwd:(NSString *)passwd;
@end
