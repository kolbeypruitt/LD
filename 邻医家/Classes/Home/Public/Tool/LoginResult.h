//
//  LoginResult.h
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *token;
/**
 *  0,注册用户 1，医院管理者 2，入驻医生 3，入驻医友 4，科室主任
 */
@property (nonatomic,assign) int type;
@property (nonatomic,copy) NSString *errorCode;
@end
