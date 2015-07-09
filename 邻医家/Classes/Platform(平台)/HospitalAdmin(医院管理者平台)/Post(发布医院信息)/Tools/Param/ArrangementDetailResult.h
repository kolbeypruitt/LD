//
//  ArrangementDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ArrangementDetail;
#import <Foundation/Foundation.h>

@interface ArrangementDetailResult : NSObject
@property (nonatomic,strong) ArrangementDetail *arrangements;
@property (nonatomic,copy) NSString *status;
@end
