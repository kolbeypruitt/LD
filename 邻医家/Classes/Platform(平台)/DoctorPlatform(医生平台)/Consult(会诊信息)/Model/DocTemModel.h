//
//  DocTemModel.h
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocTemModel : NSObject
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *clientNumber;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,assign) int gsstatus;
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *illness;
@property (nonatomic,copy) NSString *ishospital;
@property (nonatomic,copy) NSString *jobType;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *telnum;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,assign) int type;
@end
