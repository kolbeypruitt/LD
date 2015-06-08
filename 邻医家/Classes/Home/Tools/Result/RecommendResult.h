//
//  RecommendResult.h
//  邻医家
//
//  Created by Daniel on 15/5/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) NSArray *doctors;
@property (nonatomic,strong) NSArray *cases;
@property (nonatomic,strong) NSArray *hospitals;
@end
