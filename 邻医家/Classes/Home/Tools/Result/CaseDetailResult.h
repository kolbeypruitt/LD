//
//  CaseDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class CaseDetail;
#import <Foundation/Foundation.h>

@interface CaseDetailResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) CaseDetail *Case;
@end
