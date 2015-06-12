//
//  SetCharageParam.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface SetCharageParam : LDBaseParam
/**
 *  科室ID
 */
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *telnum;
@property (nonatomic,copy) NSString *name;
@end
