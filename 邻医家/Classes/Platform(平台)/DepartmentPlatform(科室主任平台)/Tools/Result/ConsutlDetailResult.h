//
//  ConsutlDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConsutlDetailResult : NSObject
@property (nonatomic,assign) int accept;
@property (nonatomic,assign) int all;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *illness;
@property (nonatomic,copy) NSString *ishospital;
@property (nonatomic,copy) NSString *jobType;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,assign) int operationNum;
@property (nonatomic,copy) NSString *opreationName;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,assign) int type;
@property (nonatomic,copy) NSString *caseAbstract;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *addressToGo;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,copy) NSString *idfirstaid;
@property (nonatomic,copy) NSString *isVIP;
@property (nonatomic,copy) NSString *lastDiagnose;
@property (nonatomic,copy) NSString *lastHospitalDepartment;
@property (nonatomic,copy) NSString *locationToGo;
@property (nonatomic,copy) NSString *patientName;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *purpose;
@end
