//
//  HomeTool.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "RecommendDocParam.h"
#import "RecommendDocResult.h"
#import "HospitalLevel.h"
#import "RecommendHosParam.h"
#import "RecommendHosResult.h"
#import "CommonDiseaseParam.h"
#import "CommonDisResult.h"
#import "MultiJobParam.h"
#import "MultiJobResult.h"
#import "CoreExpertParam.h"
#import "CoreExpertResult.h"
#import "DocSearchParam.h"
#import "DocSearchResult.h"
#import "HosRankParam.h"
#import "HosRankResult.h"
#import "HomeTool.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "Common.h"
#import "BaseParam.h"
#import "RecommendResult.h"
#import "Case.h"
#import "PostDocStationResult.h"
#import "PostDocStation.h"
@implementation HomeTool
+ (void)getRecommendDataWithParam:(BaseParam *)param success:(void (^)(RecommendResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GETRECOMMENDURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        RecommendResult *result = [RecommendResult objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)recommendDocDataWithParam:(RecommendDocParam *)param success:(void (^)(RecommendDocResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:RECOMMENDDOCURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        RecommendDocResult *result = [RecommendDocResult objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)recommendHosDataWithParam:(RecommendHosParam *)param success:(void (^)(RecommendHosResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:RECOMMENDHOSURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            RecommendHosResult *result = [RecommendHosResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)commonDisDataWithParam:(CommonDiseaseParam *)param success:(void (^)(CommonDisResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:COMMONDISURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)multiJobDataWithParam:(MultiJobParam *)param success:(void (^)(MultiJobResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:MULTIJOBURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            MultiJobResult *result = [MultiJobResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)coreExpertDataWithParam:(CoreExpertParam *)param success:(void (^)(CoreExpertResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:COREEXPERTURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            CoreExpertResult *result = [CoreExpertResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)docSearchResultWithParam:(DocSearchParam *)param success:(void (^)(DocSearchResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:DOCSEARCHURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            DocSearchResult *result = [DocSearchResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)hosRankResultWithParam:(HosRankParam *)param success:(void (^)(HosRankResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:HOSRANKURL parameters:param.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            HosRankResult *result = [HosRankResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)getPostDoctorStationList:(void (^)(PostDocStationResult *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:POSTDOCSTATIONURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        PostDocStationResult *result = [PostDocStationResult objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
+ (void)getHospitalLevel:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:HOSPITALLEVELURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *levels = [NSArray array];
        levels = [HospitalLevel objectArrayWithKeyValuesArray:responseObject[@"levels"]];
        if (success) {
            success(levels);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


@end



