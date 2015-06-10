//
//  QueryConsultResult.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ConsultMessage;
@interface QueryConsultResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) NSArray *gs;
@end
