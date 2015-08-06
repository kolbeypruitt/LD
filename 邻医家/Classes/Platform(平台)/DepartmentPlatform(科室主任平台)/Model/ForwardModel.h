//
//  ForwardModel.h
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForwardModel : NSObject
@property (nonatomic,assign) int accept;
@property (nonatomic,assign) int type;
@property (nonatomic,assign) int all;
@property (nonatomic,copy) NSString *addressToGo;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,copy) NSString *idfirstaid;
@property (nonatomic,copy) NSString *isVIP;
@property (nonatomic,copy) NSString *ishospital;
@property (nonatomic,copy) NSString *jobType;
@property (nonatomic,copy) NSString *lastDiagnose;
@property (nonatomic,copy) NSString *lastHospitalDepartment;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *locationToGo;
@property (nonatomic,copy) NSString *patientName;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *purpose;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *code;
@end
//{
//    accept = 0;
//    addressToGo = Jjks;
//    all = 0;
//    department = "\U76ae\U80a4\U79d1";
//    idcardNo = 430525199210257214;
//    idfirstaid = "\U662f";
//    isVIP = "\U662f";
//    ishospital = "\U662f";
//    jobType = "\U4e3b\U6cbb";
//    lastDiagnose = Jdjjc;
//    lastHospitalDepartment = Djjcjd;
//    location = "\U672a\U586b\U5199";
//    locationToGo = "\U4e1c\U57ce\U533a";
//    patientName = Jdjjx;
//    profession = Jksks;
//    purpose = "\U4f4f\U9662\U624b\U672f";
//    status = S;
//    type = 4;
//}