//
//  UILabel+LD.h
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LD)
+ (UILabel *)labelWithTitle:(NSString *)title
                       font:(int)fontsize
                  textColor:(UIColor *)color;
@end
