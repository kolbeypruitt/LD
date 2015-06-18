//
//  AppendInviteParam.h
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"
@interface AppendInviteParam : LDBaseParam
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,assign) int gender;
@property (nonatomic,copy) NSString *lastHospital;
@property (nonatomic,copy) NSString *lastDepartment;
@property (nonatomic,copy) NSString *lastDiagnose;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *job;
@property (nonatomic,copy) NSString *purpose;
@property (nonatomic,assign) int isvip;
@property (nonatomic,copy) NSString *remark;
@property (nonatomic,assign) int type;
@property (nonatomic,assign) int money;
@end
