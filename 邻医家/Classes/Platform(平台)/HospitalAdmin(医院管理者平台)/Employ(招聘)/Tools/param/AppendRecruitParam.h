//
//  AppendRecruitParam.h
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface AppendRecruitParam : LDBaseParam
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int  location;
@property (nonatomic,assign) int department;
@property (nonatomic,copy) NSString *education;
@property (nonatomic,copy) NSString *language;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,assign) int employNum;
@property (nonatomic,copy) NSString *jobname;
@property (nonatomic,copy) NSString *introduction;
@property (nonatomic,assign) int employtype;
@end
