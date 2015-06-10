//
//  QueryConsultResult.m //  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "QueryConsultResult.h"
#import "MJExtension.h"
#import "ConsultMessage.h"
@implementation QueryConsultResult
- (NSDictionary *)objectClassInArray
{
    return @{@"gs" : [ConsultMessage class]};
}
@end