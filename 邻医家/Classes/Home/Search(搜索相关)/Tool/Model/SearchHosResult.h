//
//  SearchHosResult.h
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchHosResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) NSArray *hospitals;
@end
