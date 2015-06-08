//
//  DocSearchResult.h
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Doctor.h"
@interface DocSearchResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) NSArray *doctors;
@end
