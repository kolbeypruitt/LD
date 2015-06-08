//
//  PostDocStationResult.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostDocStationResult.h"
#import "MJExtension.h"
#import "PostDocStation.h"
@implementation PostDocStationResult
- (NSDictionary *)objectClassInArray
{
    return @{@"postdoctorStations" : [PostDocStation class]};
}
@end
