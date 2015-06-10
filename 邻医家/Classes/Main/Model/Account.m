//
//  Account.m
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "Account.h"
#import "MJExtension.h"
@implementation Account
+ (Account *)accountWithTelnum:(NSString *)telnum password:(NSString *)password token:(NSString *)token
{
    Account *at = [[Account alloc] init];
    at.telnum = telnum;
    at.password = password;
    at.token = token;
    return at;
}
+ (Account *)accountWithTelnum:(NSString *)telnum password:(NSString *)password token:(NSString *)token type:(int)type department:(NSString *)department
{
    Account *acco = [Account accountWithTelnum:telnum password:password token:token];
    acco.department = department;
    acco.type = type;
    return acco;
}
MJCodingImplementation
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super init]) {
//        self.telnum = [aDecoder decodeObjectForKey:@"telnum"];
//        self.password = [aDecoder decodeObjectForKey:@"password"];
//        self.token = [aDecoder decodeObjectForKey:@"token"];
//    }
//    return self;
//}
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:self.telnum forKey:@"telnum"];
//    [aCoder encodeObject:self.token forKey:@"token"];
//    [aCoder encodeObject:self.password forKey:@"password"];
//}
@end
