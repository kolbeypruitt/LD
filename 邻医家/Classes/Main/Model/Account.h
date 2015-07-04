//
//  Account.h
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>
@property (nonatomic,copy) NSString *clientNumber;
@property (nonatomic,copy) NSString *clientPwd;
@property (nonatomic,assign) int department;
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *token;
/**
 *  0,注册用户 1，医院管理者 2，入驻医生 3，入驻医友 4，科室主任
 */
@property (nonatomic,assign) int type;
@end
//{
//    clientNumber = 63057024754540;
//    clientPwd = daa8bda5;
//    department = 8;
//    id = 30;
//    status = S;
//    token = "ZEYfv4DlyJcmntydErVoflrQpIBXklrAzloJ6PDmCOQ=";
//    type = 4;
//}