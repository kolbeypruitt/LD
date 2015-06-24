//
//  CaseDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

@class CaseDetailParam,CaseDetailResult;
#import <Foundation/Foundation.h>

@interface CaseDetailTool : NSObject
+ (void)caseDetailWithParam:(CaseDetailParam *)param
                    success:(void (^)(CaseDetailResult *result))success
                    failure:(void (^)(NSError *error))failure;
@end
