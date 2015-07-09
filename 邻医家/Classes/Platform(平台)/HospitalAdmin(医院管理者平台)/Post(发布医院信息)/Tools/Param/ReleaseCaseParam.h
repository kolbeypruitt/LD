//
//  ReleaseCaseParam.h
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"
@interface ReleaseCaseParam : LDBaseParam
@property (nonatomic,assign) int gender;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) int department;
@property (nonatomic,copy) NSString *chiefComplaint;
@property (nonatomic,copy) NSString *illNow;
@property (nonatomic,copy) NSString *illBefore;
@property (nonatomic,copy) NSString *bodyCheck;
@property (nonatomic,copy) NSString *supportCheck;
@property (nonatomic,copy) NSString *diagnose;
@property (nonatomic,copy) NSString *treatmentProcess;
@property (nonatomic,copy) NSString *detail;
@end
