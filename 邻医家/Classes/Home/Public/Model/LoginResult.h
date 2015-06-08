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
@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *errorCode;
@end
