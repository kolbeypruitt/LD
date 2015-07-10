//
//  DocForwordModel.h
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocForwordModel : NSObject
@property (nonatomic,copy) NSString *addressToGo;
@property (nonatomic,copy) NSString *clientNumber;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,assign) int gsstatus;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,copy) NSString *idfirstaid;
@property (nonatomic,copy) NSString *isVIP;
@property (nonatomic,copy) NSString *ishospital;
@property (nonatomic,copy) NSString *jobType;
@property (nonatomic,copy) NSString *lastHospitalDepartment;
@property (nonatomic,copy) NSString *lastDiagnose;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *locationToGo;
@property (nonatomic,copy) NSString *patientName;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *purpose;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *telnum;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,assign) int type;
@end

