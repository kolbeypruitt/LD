//
//  AccountTool.m
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define ACCOUNTFILE ([[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"])
#import "AccountTool.h"
#import "MJExtension.h"
@implementation AccountTool
+ (void)saveAccount:(Account *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:ACCOUNTFILE];
}
+ (Account *)account
{
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:ACCOUNTFILE];
    return account;
}
@end
