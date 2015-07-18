//
//  DoctorEnterParam.h
//  邻医家
//
//  Created by Daniel on 15/6/3.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import <Foundation/Foundation.h>

@interface DoctorEnterParam : LDBaseParam
/**
 *  医生名字
 */
@property (nonatomic,copy) NSString *name;
/**
 *  医院地区
 */
@property (nonatomic,assign) int hospitalLocation;
/**
 *  身份证号
 */
@property (nonatomic,copy) NSString *idcardNo;
/**
 *  医院地址
 */
@property (nonatomic,copy) NSString *hospitalAddress;
/**
 *  医院名字
 */
@property (nonatomic,copy) NSString *hospitalName;
/**
 *  医院等级
 */
@property (nonatomic,assign) int hospitalLevel;
/**
 *   科室
 */
@property (nonatomic,assign) int department;
/**
 *  职称
 */
@property (nonatomic,assign) int techtitle;
/**
 *  简介
 */
@property (nonatomic,copy) NSString *introduction;
/**
 *  擅长疾病
 */
@property (nonatomic,copy) NSString *familiarIllness;

/**
 *  职业证号
 */
@property (nonatomic,copy) NSString *doctorNo;
@property (nonatomic,copy) NSString *telnum;

+ (instancetype)paramWithDocname:(NSString *)name
                        idcardNo:(NSString *)idcardNo
                    hospitalName:(NSString *)hospitalName
                       deparment:(int)department
                hospitalLocation:(int )hospitalLocation
                 hospitalAddress:(NSString *)hospitalAddress
                   hospitalLevel:(int)hospitalLevel
                       techtitle:(int)techtitle
                    introduction:(NSString *)introduction
                 familiarIllness:(NSString *)failiarIllness
                        doctorNO:(NSString *)doctorNo;

@end




