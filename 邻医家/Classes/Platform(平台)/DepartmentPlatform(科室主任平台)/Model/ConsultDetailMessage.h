//
//  ConsultDetailMessage.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConsultDetailMessage : NSObject
@property (nonatomic,copy) NSString *clientNumber;
/**
 *  会诊的类型 1，开刀 2，疑难杂症会诊 3，临时坐诊 4，自由转诊
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
@property (nonatomic,copy) NSString *ishospital;
/**
 *  手术台数
 */
@property (nonatomic,assign) int operationNum;
/**
 *  手术名字
 */
@property (nonatomic,copy) NSString *opreationName;
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
@property (nonatomic,assign) int gsstatus;
@property (nonatomic,copy) NSString *illness;
@property (nonatomic,copy) NSString *jobType;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *caseAbstract;
@property (nonatomic,copy) NSString *addressToGo;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,copy) NSString *idfirstaid;
@property (nonatomic,copy) NSString *lastDiagnose;
@property (nonatomic,copy) NSString *lastHospitalDepartment;
@property (nonatomic,copy) NSString *locationToGo;
@property (nonatomic,copy) NSString *isVIP;

@property (nonatomic,copy) NSString *patientName;
@property (nonatomic,copy) NSString *purpose;
@property (nonatomic,copy) NSString *status;
@end
