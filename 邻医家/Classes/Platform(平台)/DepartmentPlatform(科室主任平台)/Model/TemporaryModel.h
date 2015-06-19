//
//  TemporaryModel.h
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemporaryModel : NSObject
@property (nonatomic,assign) int accept;
@property (nonatomic,assign) int all;
@property (nonatomic,assign) int type;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *jobType;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *ishospital;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *time;
@end
//{
//    accept = 0;
//    address = "\U5ef6\U957f\U8def";
//    all = 0;
//    department = "\U76ae\U80a4\U79d1";
//    hospital = "\U5341\U9662";
//    ishospital = "\U5426";
//    jobType = "\U526f\U9ad8";
//    location = "\U95f8\U5317\U533a";
//    status = S;
//    time = "2015-06-18";
//    type = 3;
//}