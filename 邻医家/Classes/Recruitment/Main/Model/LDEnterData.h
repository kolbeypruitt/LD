//
//  LDEnterData.h
//  邻医家
//
//  Created by Daniel on 15/6/3.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDEnterData : NSObject
/**
 *  医院地区
 */
@property (nonatomic,assign) int hospitalLocation;
/**
 *  医院等级
 */
@property (nonatomic,assign) int hospitalLevel;
/**
 *  科室
 */
@property (nonatomic,assign) int department;
/**
 *  职称
 */
@property (nonatomic,assign) int techtile;

@end
