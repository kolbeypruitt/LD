//
//  HomeTool.h
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class RecommendHosParam,RecommendDocParam,CommonDiseaseParam,MultiJobParam,CoreExpertParam,DocSearchParam,HosRankParam,BaseParam;
@class RecommendHosResult,RecommendDocResult,CommonDisResult,MultiJobResult,CoreExpertResult,DocSearchResult,HosRankResult,RecommendResult,MultiJobIDResult,PostDocStationResult;
#import <Foundation/Foundation.h>

@interface HomeTool : NSObject
/**
 *  加载推荐数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getRecommendDataWithParam:(BaseParam *)param success:(void (^)(RecommendResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  加载推荐医院数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)recommendHosDataWithParam:(RecommendHosParam *)param success:( void (^)(RecommendHosResult *result) )success failure:( void (^)(NSError *error))failure;
/**
 *  加载推荐医生数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)recommendDocDataWithParam:(RecommendDocParam *)param success:(void (^)(RecommendDocResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  加载常见病例数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)commonDisDataWithParam:(CommonDiseaseParam *)param success:(void (^)(CommonDisResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  加载推荐多点执业数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)multiJobDataWithParam:(MultiJobParam *)param success:(void (^)(MultiJobResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *   根据id获取多点执业数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)multiJobDataWithId:(MultiJobParam *)param success:(void (^)(MultiJobIDResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  加载推荐重要专家数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)coreExpertDataWithParam:(CoreExpertParam *)param success:(void (^)(CoreExpertResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  加载医院搜索数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)docSearchResultWithParam:(DocSearchParam *)param success:(void (^)(DocSearchResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  加载推荐医院等级数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)hosRankResultWithParam:(HosRankParam *)param success:(void (^)(HosRankResult *resulut))success failure:(void (^)(NSError *error))failure;
/**
 *  加载推荐医院等级数据
 *
 */
+ (void)getHospitalLevel:(void (^)(NSArray *levels))success failure:(void (^)(NSError *error))failure;
/**
 *  获取博士后站点信息列表
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getPostDoctorStationList:(void (^)(PostDocStationResult *result))success
                         failure:(void (^)(NSError *error))failure;

@end

