//
//  PatientEnterParam.h
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDBaseParam.h"
@interface PatientEnterParam : LDBaseParam
/**
 *  医友名字
 */
@property (nonatomic,copy) NSString *name;
/**
 *   身份证号码
 */
@property (nonatomic,copy) NSString *idcardNo;
/**
 *  所在地区id
 */
@property (nonatomic,assign) int location;
/**
 *  详细地址
 */
@property (nonatomic,copy) NSString *address;
+ (instancetype)paramWithName:(NSString *)name
                     idcardNo:(NSString *)idcardNo
                     location:(int )location
                      address:(NSString *)address;
@end
