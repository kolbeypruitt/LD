//
//  DocArrangementParam.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"
@interface DocArrangementParam : LDBaseParam
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *timePeriod;
@property (nonatomic,assign) int department;
@property (nonatomic,assign) int techtitle;
+ (instancetype)paramWithName:(NSString *)name
                   timePeriod:(NSString *)timePeriod
                   department:(int)department
                    techtitle:(int)techtitle;
@end
