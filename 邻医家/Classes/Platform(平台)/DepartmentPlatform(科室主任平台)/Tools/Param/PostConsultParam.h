//
//  SurgeryParam.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import <Foundation/Foundation.h>

@interface PostConsultParam : LDBaseParam

/**
 *  科室
 */
@property (nonatomic,assign) int department;
/**
 *  联系方式
 */
@property (nonatomic,copy) NSString *telnum;
/**
*  疾病名称
*/
@property (nonatomic,copy) NSString *illness;
/**
*  约定时间
*/
@property (nonatomic,copy) NSString *gctime;
/**
*  约定医院所在地区
*/
@property (nonatomic,assign) int location;
/**
*  详细地址
*/
@property (nonatomic,copy) NSString *address;
/**
*  是否住院 1 是 2 否
*/
@property (nonatomic,assign) int isHospital;
/**
*  约定医院的名字
*/
@property (nonatomic,copy) NSString *appointHospital;
/**
*  拟邀请医，医生技术职务
*/
@property (nonatomic,copy) NSString *doctorJob;
/**
*  会诊的类型 1，开刀 2，疑难杂症会诊 3，临时坐诊 4，转诊
*/
@property (nonatomic,assign) int consultationType;
/**
*  手术名称
*/
@property (nonatomic,copy) NSString *operationName;
/**
*  手术台数
*/
@property (nonatomic,assign) int operationNum;
/**
*  会诊患者病例摘要
*/
@property (nonatomic,copy) NSString *caseAbstract;
/**
*  病人姓名
*/
@property (nonatomic,copy) NSString *patientName;
/**
*  病人身份证号
*/
@property (nonatomic,copy) NSString *idcardNo;
/**
*  最后一次就医科室
*/
@property (nonatomic,copy) NSString *lastHospitalDepartment;
/**
*  最后一次诊断
*/
@property (nonatomic,copy) NSString *lastDiagnose;
/**
*  拟转诊的医院地区
*/
@property (nonatomic,assign) int hospitalLocationTogo;
/**
*  拟转诊的就医地址
*/
@property (nonatomic,copy) NSString *hospitalAddressTogo;
/**
*  接诊医师的专业
*/
@property (nonatomic,copy) NSString *profession;
/**
*  转诊目的
*/
@property (nonatomic,copy) NSString *purpose;
/**
*  是否需要VIP 1，要 2 不要
*/
@property (nonatomic,assign) int isvip;
/**
*  是否需要急救 1，要 2 不要
*/
@property (nonatomic,assign) int isfirstaid;
@end
