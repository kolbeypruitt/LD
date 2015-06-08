//
//  AccountTool.h
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface AccountTool : NSObject
/**
 *    存储账号
 *  @param account 待存储的账号
 */
+ (void)saveAccount:(Account *)account;
/**
*     取出存储的帐号
*/
+ (Account *)account;
@end
