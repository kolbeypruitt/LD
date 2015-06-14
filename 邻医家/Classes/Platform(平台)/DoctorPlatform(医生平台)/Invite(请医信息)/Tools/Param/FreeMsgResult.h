//
//  FreeMsgResult.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class InviteDocDetail;
#import <Foundation/Foundation.h>

@interface FreeMsgResult : NSObject
@property (nonatomic,strong) InviteDocDetail *seekDoctor;
@property (nonatomic,copy) NSString *status;
@end
