//
//  LoginDocDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Doctor;
#import <Foundation/Foundation.h>

@interface LoginDocDetailResult : NSObject
@property (nonatomic,strong) NSArray *cases;
@property (nonatomic,strong)  Doctor *intorduction;
@property (nonatomic,strong) NSArray *papers;
@property (nonatomic,copy) NSString *status;
@end
