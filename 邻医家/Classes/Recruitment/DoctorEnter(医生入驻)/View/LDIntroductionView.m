//
//  LDIntroductionView.m
//  邻医家
//
//  Created by SXQ on 15/7/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDTextView.h"
#import "LDIntroductionView.h"

@implementation LDIntroductionView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LDIntroductionView" owner:nil options:nil] lastObject];
    }
    return self;
}
@end
