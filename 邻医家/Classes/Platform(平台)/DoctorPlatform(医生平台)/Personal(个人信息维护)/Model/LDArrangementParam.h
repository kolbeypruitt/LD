//
//  LDArrangementParam.h
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface LDArrangementParam : LDBaseParam
@property (nonatomic,copy) NSString *arrangeHospitals;
@property (nonatomic,copy) NSString *arrangements;
+ (instancetype)paramWithArrangements:(NSString *)arrangements
                     arrangeHospitals:(NSString *)arrangeHospitals;
@end
