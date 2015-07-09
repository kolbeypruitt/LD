//
//  ReleaseArrangeParam.h
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface ReleaseArrangeParam : LDBaseParam
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *timePeriod;
@property (nonatomic,assign) int department;
@property (nonatomic,assign) int techtitle;
@end
