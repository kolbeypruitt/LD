//
//  RecommendDocResult.h
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
@interface RecommendDocResult : Doctor
/**
 *  状态参数
 */
@property (nonatomic,copy) NSString *status;
/**
 *  doctors数组中装的是doctor模型
 */
@property (nonatomic,strong) NSArray *doctors;
@end
