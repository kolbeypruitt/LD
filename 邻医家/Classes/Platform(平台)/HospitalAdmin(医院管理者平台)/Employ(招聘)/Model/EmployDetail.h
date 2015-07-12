//
//  EmployDetail.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployDetail : NSObject
@property (nonatomic,assign) int accept;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) int all;
@property (nonatomic,copy) NSString *clientNumber;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *education;
@property (nonatomic,assign) int employNum;
@property (nonatomic,copy) NSString *introduction;
@property (nonatomic,copy) NSString *jobname;
@property (nonatomic,copy) NSString *jobtype;
@property (nonatomic,copy) NSString *language;
@property (nonatomic,copy) NSString *profession;
@property (nonatomic,copy) NSString *title;
@end
//{
//    accept = 0;
//    age = 24;
//    all = 0;
//    department = "\U547c\U5438\U5185\U79d1";
//    education = "\U4e0d\U9650";
//    employNum = 12;
//    introduction = sdfaasfasfasf;
//    jobname = asdfasf;
//    jobtype = "\U5168\U804c";
//    language = "\U4e0d\U9650";
//    location = "\U4e1c\U57ce\U533a";
//    profession = 1212;
//    status = S;
//    title = sadfsafsda;
//}