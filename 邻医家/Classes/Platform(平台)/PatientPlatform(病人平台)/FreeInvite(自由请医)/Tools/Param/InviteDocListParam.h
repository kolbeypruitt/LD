//
//  InviteDocListParam.h
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"

@interface InviteDocListParam : LDBaseParam
/**
 *  请医信息的类型1-自由请医2-悬赏就医
 */
@property (nonatomic,assign) int type;
/**
 *  请医信息的类型1-自由请医2-悬赏就医
 *
 *  @param type 请医信息的类型1-自由请医2-悬赏就医
 *
 *  @return
 */
+ (instancetype)paramWithType:(int)type;
@end
