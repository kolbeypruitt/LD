//
//  SearchHosTool.h
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class SearchHosParam,SearchHosResult;
#import <Foundation/Foundation.h>

@interface SearchHosTool : NSObject
+ (void)searchHosWithParam:(SearchHosParam *)param
                   success:(void (^)(SearchHosResult *result))success
                   failure:(void (^)(NSError *error))failure;
@end
