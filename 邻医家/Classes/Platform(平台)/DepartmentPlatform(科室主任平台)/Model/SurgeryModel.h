//
//  SurgeryModel.h
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SurgeryModel : NSObject
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
@property (nonatomic,copy) NSString *time;
@property (nonatomic,assign) int type;
@property (nonatomic,copy) NSString *code;
@end
//{
//    accept = 0;
//    address = "\U4e2d\U5c71\U5317\U8def56\U53f7";
//    all = 0;
//    department = "\U76ae\U80a4\U79d1";
//    hospital = "\U4eba\U6c11\U533b\U9662";
//    illness = "\U8fc7\U654f\U6027\U76ae\U708e";
//    ishospital = "\U662f";
//    jobType = "\U4e3b\U6cbb";
//    location = "\U957f\U5b81\U533a";
//    operationNum = 1;
//    opreationName = "\U5207\U9664";
//    status = S;
//    time = "2015-06-18";
//    type = 1;
//}