//
//  UserResult.h
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDUser;
#import <Foundation/Foundation.h>

@interface UserResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) LDUser *account;
@end
