//
//  FreeInviteDeResult.h
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class PatienInviteDetail;
#import <Foundation/Foundation.h>

@interface FreeInviteDeResult : NSObject
@property (nonatomic,strong) PatienInviteDetail *seekDoctor;
@property (nonatomic,copy) NSString *status;
@end
