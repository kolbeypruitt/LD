//
//  UILabel+LD.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "UILabel+LD.h"

@implementation UILabel (LD)
+ (UILabel *)labelWithTitle:(NSString *)title font:(int)fontsize textColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:fontsize];
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    return label;
}
@end
