//
//  StubbornModel.h
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StubbornModel : NSObject
@property (nonatomic,assign) int accept;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,assign) int all;
@property (nonatomic,copy) NSString *caseAbstract;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *illness;
@property (nonatomic,copy) NSString *ishospital;
@property (nonatomic,copy) NSString *jobType;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,assign) int type;
@property (nonatomic,copy) NSString *code;
@end
//{
//    accept = 0;
//    address = "\U9e64\U5e86\U8def";
//    all = 0;
//    caseAbstract = "\U8fc7\U654f";
//    department = "\U76ae\U80a4\U79d1";
//    hospital = "\U4e94\U9662";
//    illness = "\U98ce\U75b9";
//    ishospital = "\U5426";
//    jobType = "\U4e3b\U6cbb";
//    location = "\U95f5\U884c\U533a";
//    status = S;
//    time = "2015-06-18";
//    type = 2;
//}