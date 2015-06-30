//
//  SearchCaseResult.h
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchCaseResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) NSArray *cases;
@end
