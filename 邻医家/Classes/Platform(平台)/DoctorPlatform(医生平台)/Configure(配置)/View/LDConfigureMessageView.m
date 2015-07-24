//
//  LDConfigureMessageView.m
//  邻医家
//
//  Created by Daniel on 15/7/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDConfigureMessageView.h"

@implementation LDConfigureMessageView
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super initWithCoder:aDecoder]) {
//        self = [self init];
//    }
//    return self;
//}
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self = [[[NSBundle mainBundle] loadNibNamed:@"LDConfigureMessageView" owner:nil options:nil] lastObject];
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LDConfigureMessageView" owner:nil options:nil] lastObject];
    }
    return self;
}

@end
