//
//  BaseResult.h
//  邻医家
//
//  Created by Daniel on 15/6/3.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *errorCode;
@property (nonatomic,copy) NSString *errorMsg;
@end
