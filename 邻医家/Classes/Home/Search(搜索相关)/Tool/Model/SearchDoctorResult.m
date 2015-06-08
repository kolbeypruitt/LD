//
//  SearchDoctorResult.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SearchDoctorResult.h"
#import "MJExtension.h"
#import "Doctor.h"
@implementation SearchDoctorResult
- (NSDictionary *)objectClassInArray
{
    return @{@"doctors" : [Doctor class]};
}
@end
