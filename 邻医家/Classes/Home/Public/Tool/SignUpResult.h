//
//  SignUpResult.h
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,assign) int errorCode;
@property (nonatomic,copy) NSString *errorMsg;
@end
