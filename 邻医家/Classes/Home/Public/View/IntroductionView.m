//
//  IntroductionView.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "IntroductionView.h"

@implementation IntroductionView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSArray *objs = [[NSBundle mainBundle] loadNibNamed:@"IntroductionView" owner:nil options:nil];
        self = [objs lastObject];
    }
    return self;
}
@end
