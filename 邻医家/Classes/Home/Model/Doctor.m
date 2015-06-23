//
//  Doctor.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor
+ (instancetype)doctorWithName:(NSString *)name
                          icon:(NSString *)icon
                        detail:(NSString *)detail
                      hospital:(NSString *)hospital
                     techtitil:(NSString *)techtitle
{
    Doctor *doc = [[Doctor alloc] init];
    doc.techtitle = techtitle;
    doc.headurl = icon;
    doc.introduction = detail;
    doc.name = name;
    doc.hospital = hospital;
    return doc;
}
@end
