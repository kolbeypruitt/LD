//
//  InviteDocDetail.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InviteDocDetail : NSObject
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *clientNumber;
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,copy) NSString *isVIP;
@property (nonatomic,copy) NSString *job;
@property (nonatomic,copy) NSString *lastDepartment;
@property (nonatomic,copy) NSString *lastDiagnose;
@property (nonatomic,copy) NSString *lastHospital;
@property (nonatomic,assign) int money;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *purpose;
@property (nonatomic,copy) NSString *remark;
/**
 *  1.已申请，2，已录取
 */
@property (nonatomic,assign) int sdstatus;
@end
