//
//  DocConsultDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DocConsultDetailParam;
#import <Foundation/Foundation.h>

@interface DocConsultDetailTool : NSObject
+ (void)getDocConsultDetailWithParam:(DocConsultDetailParam *)param
                             success:(void (^)(id result))success
                             failure:(void (^)(NSError *error))failure;
@end
