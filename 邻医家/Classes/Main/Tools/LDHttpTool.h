//
//  LDHttpTool.h
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AFNetworking.h"
#import <Foundation/Foundation.h>
#import "LDFormData.h"
@interface LDHttpTool : NSObject
+ (void)postWithURL:(NSString *)url
             params:(NSDictionary *)params
      formDataArray:(NSArray *)formDataArray
            success:(void (^)(id json))success
            failure:(void (^)(NSError *error))failure;
+ (void)getWithURL:(NSString *)url
            params:(NSDictionary *)params
           success:(void (^)(id json))success
           failure:(void (^)(NSError *error))failure;
+ (void)postWithURL:(NSString *)url
             params:(NSDictionary *)params
            success:(void (^)(id json))success
            failure:(void (^)(NSError *error))failure;
@end
