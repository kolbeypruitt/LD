//
//  DoctorDetailParam.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorDetailParam : NSObject
@property (nonatomic,assign) int id;
+ (instancetype)paramWithId:(int)Id;
@end
