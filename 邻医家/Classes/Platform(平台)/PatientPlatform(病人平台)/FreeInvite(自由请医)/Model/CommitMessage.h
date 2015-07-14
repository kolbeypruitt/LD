//
//  CommitMessage.h
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommitMessage : NSObject
@property (nonatomic,copy) NSString *stringMsg;
@property (nonatomic,assign) int intMsg;
+ (instancetype)messageWithStringMsg:(NSString *)stringMsg
                              intMsg:(int)intMsg;

@end

