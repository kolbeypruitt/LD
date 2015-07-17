//
//  LDCopyView.m
//  邻医家
//
//  Created by Daniel on 15/7/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDCopyView.h"
@interface LDCopyView ()

@end
@implementation LDCopyView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LDCopyView" owner:nil options:nil] lastObject];
    }
    return self;
}

@end
