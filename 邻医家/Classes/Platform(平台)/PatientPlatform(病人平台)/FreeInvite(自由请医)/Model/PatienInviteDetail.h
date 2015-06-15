//
//  PatienInviteDetail.h
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface PatienInviteDetail : NSObject
@property (nonatomic,assign) int accept;
@property (nonatomic,assign) int all;
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,copy) NSString *isVIP;
@property (nonatomic,copy) NSString *job;
@property (nonatomic,copy) NSString *lastDepartment;
@property (nonatomic,copy) NSString *lastDiagnose;
@property (nonatomic,copy) NSString *lastHospital;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *purpose;
@property (nonatomic,copy) NSString *remark;
@end
