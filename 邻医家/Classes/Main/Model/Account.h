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
+ (Account *)accountWithTelnum:(NSString *)telnum password:(NSString *)password token:(NSString *)token;
@end
