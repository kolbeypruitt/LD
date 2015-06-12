//
//  GetEmployeeResult.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface GetEmployeeResult : NSObject
@property (nonatomic,strong) NSArray *employs;
@property (nonatomic,assign) int jobtype;
@property (nonatomic,copy) NSString *status;
@end
