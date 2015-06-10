//
//  ConsultDetailMessage.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConsultDetailMessage : NSObject
/**
 *  类型
 */
@property (nonatomic,assign) int type;
/**
 *   所有简历
 */
@property (nonatomic,assign) int all;
/**
 *  已录取的简历
 */
@property (nonatomic,assign) int accept;
/**
 *  地址
 */
@property (nonatomic,copy) NSString *address;
/**
 *  科室
 */
@property (nonatomic,copy) NSString *department;
/**
 *  医院
 */
@property (nonatomic,copy) NSString *hospital;
/**
 *  是否住院 1.是 2 否
 */
@property (nonatomic,assign) int   ishospital;
/**
 *  手术台数
 */
@property (nonatomic,copy) NSString *operationNum;
/**
 *  手术名字
 */
@property (nonatomic,copy) NSString *operationName;
/**
 *  专业
 */
@property (nonatomic,copy) NSString *profession;
/**
 *  手机号
 */
@property (nonatomic,copy) NSString *telnum;
/**
 *  时间
 */
@property (nonatomic,copy) NSString *time;
@end
