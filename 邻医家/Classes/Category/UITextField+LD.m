//
//  UITextField+LD.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "UITextField+LD.h"

@implementation UITextField (LD)
+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder tag:(int)tag font:(int)font textColor:(UIColor *)color delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textfield = [[UITextField alloc] init];
    textfield.placeholder = placeholder;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield.textAlignment = NSTextAlignmentRight;
    textfield.tag = tag;
    UIFont *textFont = [UIFont systemFontOfSize:font];
    textfield.font = textFont;
    textfield.textColor = color;
    textfield.delegate = delegate;
    [textfield setValue:textFont forKeyPath:@"_placeholderLabel.font"];
    return textfield;
}
@end
