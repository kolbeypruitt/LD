//
//  ManagerDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ManagerDetail;
#import <Foundation/Foundation.h>
@interface ManagerDetailResult : NSObject
@property (nonatomic,strong) ManagerDetail *info;
@property (nonatomic,copy) NSString *status;
@end
