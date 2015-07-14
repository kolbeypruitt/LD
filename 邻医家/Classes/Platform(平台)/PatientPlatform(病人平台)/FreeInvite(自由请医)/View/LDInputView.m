//
//  LDInputView.m
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "IWCommon.h"
#import "LDInputMessage.h"
#import "LDInputView.h"
#import "ActionSheetCustomPicker+LD.h"
#import "ActionSheetDatePicker.h"
@interface LDInputView ()<UITextFieldDelegate>
@property (nonatomic,weak) UILabel *firstTitleLabel;
@end
@implementation LDInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled  = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self addCustomViews];
        [self layoutCustomViews];
    }
    return self;
}
- (void)addCustomViews
{
    UILabel *firstLabel = [[UILabel alloc] init];
    firstLabel.textAlignment = NSTextAlignmentLeft;
    firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
    firstLabel.font = [UIFont systemFontOfSize:15];
    firstLabel.backgroundColor = [UIColor clearColor];
    firstLabel.textColor = [UIColor blackColor];
    [self addSubview:firstLabel];
    self.firstTitleLabel = firstLabel;
    
    UITextField *inputFiel = [[UITextField alloc] init];
    inputFiel.textAlignment = NSTextAlignmentRight;
    inputFiel.translatesAutoresizingMaskIntoConstraints = NO;
    inputFiel.borderStyle = UITextBorderStyleNone;
    inputFiel.font = firstLabel.font;
    inputFiel.delegate = self;
    [self addSubview:inputFiel];
    self.inputField = inputFiel;
    
}
- (void)layoutCustomViews
{
    NSDictionary *views = @{@"firstLabel" : self.firstTitleLabel ,@"secondLabel" : self.inputField};
    
    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[firstLabel(120)]-10-[secondLabel]-20-|"
                                                             options:0
                                                             metrics:nil
                                                               views:views];
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[firstLabel(30)]"
                                                              options:0
                                                              metrics:nil
                                                                views:views];
    NSArray *conts3  = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[secondLabel(30)]" options:0 metrics:nil views:views];
    [self addConstraints:conts];
    [self addConstraints:conts2];
    [self addConstraints:conts3];
}
- (void)setInputMessage:(LDInputMessage *)inputMessage
{
    
    _inputMessage = inputMessage;
    self.firstTitleLabel.text = inputMessage.firstTitle;
    self.inputField.placeholder = inputMessage.placeHolder;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (self.inputMessage.optionDelegate) {
        ActionSheetCustomPicker *picker = [ActionSheetCustomPicker customPickerWithTitle:self.inputMessage.placeHolder
                                                                                delegate:self.inputMessage.optionDelegate
                                                                                  origin:textField];
        [picker showActionSheetPicker];
        return NO;
    }else
    {
        return YES;
    }
}
@end
