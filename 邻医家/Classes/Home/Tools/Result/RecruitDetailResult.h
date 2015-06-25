//
//  RecruitDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployDetailInfo;
#import <Foundation/Foundation.h>

@interface RecruitDetailResult : NSObject
@property (nonatomic,strong) EmployDetailInfo *employInfo;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *errorCode;
@end
