//
//  AllInviteParam.h
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface AllInviteParam : LDBaseParam
@property (nonatomic,assign) int id;
+ (instancetype)paramWithId:(int)ID;
@end
