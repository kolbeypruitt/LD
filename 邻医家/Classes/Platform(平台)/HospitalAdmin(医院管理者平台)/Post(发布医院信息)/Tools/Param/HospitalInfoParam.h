//
//  HospitalInfoParam.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface HospitalInfoParam : LDBaseParam
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *website;
+ (instancetype)paramWithName:(NSString *)name website:(NSString *)website;
@end
