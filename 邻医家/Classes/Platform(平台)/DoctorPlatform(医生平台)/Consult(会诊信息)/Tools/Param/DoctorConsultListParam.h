//
//  DoctorConsultListParam.h
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface DoctorConsultListParam : LDBaseParam
@property (nonatomic,assign) int type;
+ (instancetype)paramWithType:(int)type;
@end
