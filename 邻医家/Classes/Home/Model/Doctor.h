//
//  Doctor.h
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "HomeItem.h"
@interface Doctor : NSObject
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *techtitle;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,copy) NSString *introduction;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *headurl;
+ (instancetype)doctorWithName:(NSString *)name
                          icon:(NSString *)icon
                        detail:(NSString *)detail
                      hospital:(NSString *)hospital
                     techtitil:(NSString *)techtitle;
@end
