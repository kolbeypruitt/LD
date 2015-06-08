//
//  LDFormData.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDFormData.h"

@implementation LDFormData
+ (instancetype)formDataWithData:(NSData *)data
                            name:(NSString *)name
                        filename:(NSString *)filename
                        mimiType:(NSString *)mimiType
{
    LDFormData *ldformData = [[LDFormData alloc] init];
    ldformData.data = data;
    ldformData.name = name;
    ldformData.filename = filename;
    ldformData.mimiType = mimiType;
    return ldformData;
}
@end
