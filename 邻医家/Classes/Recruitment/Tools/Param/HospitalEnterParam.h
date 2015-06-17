//
//  HospitalEnterParam.h
//  邻医家
//
//  Created by Daniel on 15/5/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import <Foundation/Foundation.h>

@interface HospitalEnterParam :  LDBaseParam
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int location;
@property (nonatomic,copy) NSString *taxNo;
@property (nonatomic,assign) int level;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *realname;
@property (nonatomic,copy) NSString *idcardNo;
+ (instancetype)paramWithHosName:(NSString *)name
                        location:(int )location
                           taxNo:(NSString *)taxNo
                           level:(int)level
                         address:(NSString *)address
                        realname:(NSString *)realname
                        idcardNo:(NSString *)idcardNo;
@end
