//
//  LDBaseParam.h
//  邻医家
//
//  Created by Daniel on 15/5/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface LDBaseParam : NSObject
@property (nonatomic,copy) NSString *token;
@property (nonatomic,assign) int id;
+ (instancetype)param;
+ (instancetype)paramWithId:(int)ID;
@end
