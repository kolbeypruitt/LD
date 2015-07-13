//
//  ApplianTool.h
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class RecruitResult,QueryConsultResult,LDBaseParam,EmployDetail,AppliantDetailResult,InfoListResult,ConsultDetailMessage;
#import <Foundation/Foundation.h>
@interface ApplianTool : NSObject
+ (void)myInviteSuccess:(void (^)(InfoListResult *result))success
                failure:(void (^)(NSError *error))failure;
+ (void)myInviteDetailWithParam:(LDBaseParam *)param
                        success:(void (^)(id result))success
                        failure:(void (^)(NSError *error))failure;

+ (void)myConsultSuccess:(void (^)(QueryConsultResult *result))success
                 failure:(void (^)(NSError *error))failure;

+ (void)myconsultDetailWithParam:(LDBaseParam *)param
                         success:(void (^)(ConsultDetailMessage *detail))success
                         failure:(void (^)(NSError *error))failure;




+ (void)myAppliantSuccess:(void (^)(RecruitResult *result))success
                  failure:(void (^)(NSError *error))failure;
+ (void)myAppliantWithParam:(LDBaseParam *)param
                    success:(void (^)(AppliantDetailResult *result))success
                    failure:(void (^)(NSError *error))failure;
@end

@interface AppliantDetailResult : NSObject
@property (nonatomic,strong) EmployDetail *employInfo;
@property (nonatomic,copy) NSString *status;
@end

