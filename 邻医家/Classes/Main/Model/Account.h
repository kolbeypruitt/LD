//
//  Account.h
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>
@property (nonatomic,copy) NSString *telnum;
@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSString *department;
/**
 *  0,注册用户 1，医院管理者 2，入驻医生 3，入驻医友 4，科室主任
 */
@property (nonatomic,assign) int type;
+ (Account *)accountWithTelnum:(NSString *)telnum
                      password:(NSString *)password
                         token:(NSString *)token
                          type:(int)type
                    department:(NSString *)department;
+ (Account *)accountWithTelnum:(NSString *)telnum password:(NSString *)password token:(NSString *)token;
@end
