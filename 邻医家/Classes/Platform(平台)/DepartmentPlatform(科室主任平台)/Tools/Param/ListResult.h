//
//  ListResult.h
//  邻医家
//
//  Created by Daniel on 15/7/16.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) NSArray *employers;
@end
