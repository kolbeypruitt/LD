//
//  UIButton+LD.h
//  邻医家
//
//  Created by Daniel on 15/5/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LD)
+ (UIButton *)setupBtnWithImage:(NSString *)image selectedImage:(NSString *)selImage target:(id)target action:(SEL)action;
@end
