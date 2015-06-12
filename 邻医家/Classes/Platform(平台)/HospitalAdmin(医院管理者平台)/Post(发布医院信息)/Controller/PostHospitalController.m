//
//  PostHospitalController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "BaseResult.h"
#import "UIBarButtonItem+ENTER.h"
#import "PostHospitalController.h"
#import "HospitalInfoParam.h"
#import "PostHosInfoTool.h"
#import "LDTextView.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "IWCommon.h"
@interface PostHospitalController () <UITextViewDelegate>
@property (nonatomic,weak) UILabel *webLabel;
@property (nonatomic,weak) UILabel *hospitalProfile;
@property (nonatomic,weak) UITextField *webTextField;
@property (nonatomic,strong) NSMutableArray *underlines;
@property (nonatomic,weak) LDTextView *hospitalProfileView;
@end

@implementation PostHospitalController
- (NSMutableArray *)underlines
{
    if (_underlines == nil) {
        _underlines = [NSMutableArray array];
    }
    return _underlines;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"填写医院简介";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self addCustomViews];
    [self layoutCustomViews];
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(commit) title:@"提交"];
}
- (void)commit
{
    if (self.webTextField.text.length == 0) {
        [MBProgressHUD showError:@"请输入医院网址"];
        return;
    }
    if (self.hospitalProfileView.text.length == 0) {
        [MBProgressHUD showError:@"请输入医院简介"];
        return;
    }
    HospitalInfoParam *param = [HospitalInfoParam paramWithName:self.webTextField.text website:self.hospitalProfileView.text];
    [PostHosInfoTool sendHosInfoWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark -  Add subviews
- (void)addCustomViews
{
    self.webLabel = [self labelWithTitle:@"医院网址"];
    self.hospitalProfile = [self labelWithTitle:@"医院简介"];
    self.webTextField = [self addTextFieldWithPlaceholder:@"请输入医院网址"];
    [self.underlines addObject:[self addLine]];
    [self.underlines addObject:[self addLine]];
    self.hospitalProfileView = [self addTextViewWithPlaceholder:@"请输入医院简介"];
    
}
- (LDTextView *)addTextViewWithPlaceholder:(NSString *)placeholder
{
    LDTextView *textView = [[LDTextView alloc] init];
    [self.view addSubview:textView];
    textView.delegate = self;
    textView.backgroundColor = IWColor(226, 226, 226);
    textView.layer.cornerRadius = 8;
    textView.placeholder = placeholder;
    return textView;
}
#pragma mark - Layout subviews
- (void)layoutCustomViews
{
    const CGFloat labelW = 60;
    const CGFloat padding = 10;
    const CGFloat labelH = 40;
    self.webLabel.frame = CGRectMake(10, 84, labelW, labelH);
    
    CGFloat webtextfX = CGRectGetMaxX(self.webLabel.frame) + padding;
    CGFloat webtextfY = self.webLabel.frame.origin.y + 8;
    CGFloat webtextfW = SCREENWIDTH - webtextfX - padding;
    CGFloat webtextfH = 30;
    self.webTextField.frame = CGRectMake(webtextfX, webtextfY, webtextfW, webtextfH);
    
    UIView *firstLine = [self.underlines firstObject];
    firstLine.frame = CGRectMake(padding, CGRectGetMaxY(self.webLabel.frame) + padding, SCREENWIDTH- 2*padding, 1);
    
    self.hospitalProfile.frame = CGRectMake(10, CGRectGetMaxY(firstLine.frame) + padding, labelW, labelH);
    
    CGFloat textViewX = webtextfX;
    CGFloat textViewY = self.hospitalProfile.frame.origin.y;
    CGFloat textViewW = webtextfW;
    CGFloat textViewH = 200;
    self.hospitalProfileView.frame = CGRectMake(textViewX, textViewY, textViewW, textViewH);
    
    UIView *secondLine = [self.underlines lastObject];
    secondLine.frame = CGRectMake(padding, CGRectGetMaxY(self.hospitalProfileView.frame)+ padding, SCREENWIDTH - 2*padding, 1);
    
    
    
}
- (UITextField *)addTextFieldWithPlaceholder:(NSString *)placeholder
{
    UITextField *textfield = [[UITextField alloc] init];
    textfield.borderStyle = UITextBorderStyleNone;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield.placeholder = placeholder;
    [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:textfield];
    return textfield;
}
- (UILabel *)labelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    return label;
}
- (UIView *)addLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    return line;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark - textview delegate method
- (void)textViewDidBeginEditing:(LDTextView *)textView
{
    [textView showPlaceHolder:NO];
}
- (void)textViewDidChange:(LDTextView *)textView
{
    if (textView.text.length) {
        [textView showPlaceHolder:NO];
    }else
    {
        [textView showPlaceHolder:YES];
    }
}
- (void)textViewDidEndEditing:(LDTextView *)textView
{
    if (textView.text.length) {
        return;
    }
    [textView showPlaceHolder:YES];
}
@end
