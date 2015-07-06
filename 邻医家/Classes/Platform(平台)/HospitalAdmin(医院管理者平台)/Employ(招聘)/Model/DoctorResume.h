//
//  DoctorResume.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorResume : NSObject
@property (nonatomic,copy) NSString *clientNumber;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *introduction;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *papers;
@property (nonatomic,assign) int id;
@property (nonatomic,assign) int resumeStatus;
@property (nonatomic,copy) NSString *techtitle;
@property (nonatomic,copy) NSString *telnum;

@end
