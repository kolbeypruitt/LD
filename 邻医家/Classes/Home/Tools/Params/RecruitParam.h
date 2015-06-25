//
//  RecruitParam.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecruitParam : NSObject
@property (nonatomic,assign) int type;
+ (instancetype)paramWithType:(int)type;
@end
