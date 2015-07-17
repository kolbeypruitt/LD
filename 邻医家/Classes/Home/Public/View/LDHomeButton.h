//
//  LDHomeButton.h
//  邻医家
//
//  Created by Daniel on 15/7/16.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDHomeButton : UIButton
+ (instancetype)homeButtonWithImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action;
@end
