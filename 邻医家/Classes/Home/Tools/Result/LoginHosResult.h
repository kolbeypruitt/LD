//
//  LoginHosResult.h
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HospitalDetail;
#import <Foundation/Foundation.h>

@interface LoginHosResult : NSObject
@property (nonatomic,strong) NSArray *cases;
@property (nonatomic,strong) NSArray *departments;
@property (nonatomic,strong) NSArray *doctors;
@property (nonatomic,strong) HospitalDetail *hospital;
@property (nonatomic,copy) NSString *status;
@end
