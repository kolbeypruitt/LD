//
//  SearchCaseTool.h
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class SearchCaseParam,SearchCaseResult;
#import <Foundation/Foundation.h>

@interface SearchCaseTool : NSObject
+ (void)searchCaseWithParam:(SearchCaseParam *)param
                    success:(void (^)(SearchCaseResult *result))success
                    failure:(void (^)(NSError *error))failure;
@end
