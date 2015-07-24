//
//  LDUser.h
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDUser : NSObject
@property (nonatomic,copy) NSString *telnum;

@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *contact;
@property (nonatomic,copy) NSString *founddate;
@property (nonatomic,copy) NSString *introduction;
@property (nonatomic,copy) NSString *level;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *realname;
@property (nonatomic,copy) NSString *website;

@property (nonatomic,assign) int age;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *idcardNo;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *illness;
@property (nonatomic,copy) NSString *mailbox;
@property (nonatomic,copy) NSString *phone;

@end
