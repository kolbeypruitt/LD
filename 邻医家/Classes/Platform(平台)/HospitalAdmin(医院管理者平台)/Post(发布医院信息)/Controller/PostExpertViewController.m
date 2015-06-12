//
//  PostExpertViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "CareerDelegate.h"
#import "MBProgressHUD+MJ.h"
#import "PostExpertViewController.h"
#import "Common.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
#import "DepartmentDelegate.h"
#import "ActionSheetDatePicker+LD.h"
#import "ActionSheetCustomPicker+LD.h"
#import "UIBarButtonItem+ENTER.h"
#import "DocArrangementParam.h"
#import "BaseResult.h"
#import "PostArrangeTool.h"
@interface PostExpertViewController () <UITextFieldDelegate>
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *underlines;
@property (nonatomic,strong) NSMutableArray *textFields;
@end

@implementation PostExpertViewController
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)underlines
{
    if (_underlines == nil) {
        _underlines = [NSMutableArray array];
    }
    return _underlines;
}
- (NSMutableArray *)textFields
{
    if (_textFields == nil) {
        _textFields = [NSMutableArray array];
    }
    return _textFields;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"发布专家坐诊时间表";
    [self addCustomViews];
    [self layoutCustomViews];
    [self setNav];
}
- (void)setNav
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(submit) title:@"提交"];
}
- (void)submit
{
    NSArray *errorMsgArray = @[@"请输入专家姓名",@"请选择坐诊时间",@"请选择科室",@"请选择临床职称"];
    for (int i = 0; i < self.textFields.count; i++) {
        HospitalEnterTextField *textfield = [self.textFields objectAtIndex:i];
        if (textfield.text.length == 0) {
            [MBProgressHUD showError:[errorMsgArray objectAtIndex:i]];
            return;
        }
    }
    HospitalEnterTextField *nameText = [self.textFields objectAtIndex:0];
    HospitalEnterTextField *timeText = [self.textFields objectAtIndex:1];
    HospitalEnterTextField *departmentText = [self.textFields objectAtIndex:2];
    HospitalEnterTextField *linchuangText = [self.textFields objectAtIndex:3];
    DocArrangementParam *param = [DocArrangementParam paramWithName:nameText.text
                                                         timePeriod:timeText.text
                                                         department:departmentText.enterData.department
                                                          techtitle:linchuangText.enterData.techtile];
    [PostArrangeTool postArrangeWithParam:param success:^(BaseResult *result) {
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError *erro) {
        [MBProgressHUD showError:@"发布失败"];
    }];
    
}
- (void)addCustomViews
{
    const int count = 4;
    NSArray *titleArray = @[@"专家姓名",@"坐诊时间",@"选择科室",@"临床职称"];
    NSArray *placeholderArray = @[@"请输入专家姓名",@"如:(2015/06/06 08:30-10:30",@"请点击选择",@"请点击选择"];
    for (int i = 0 ; i < count; i++) {
        UILabel *label = [self labelWithTitle:[titleArray objectAtIndex:i]];
        [self.labels addObject:label];
        
        HospitalEnterTextField *textfield = [self addTextFieldWithPlaceholder:[placeholderArray objectAtIndex:i]];
        textfield.delegate = self;
        textfield.tag = i;
        [self.textFields addObject:textfield];
        
        UIView *line = [self addLine];
        [self.underlines addObject:line];
    }
}
- (void)layoutCustomViews
{
    const int padding = 10;
    CGFloat labelX = 10;
    CGFloat labelY = 0;
    CGFloat labelW = 60;
    CGFloat labelH = 40;
    
    CGFloat textX = 0;
    CGFloat textY = 0;
    CGFloat textW = SCREENWIDTH - textX - 8;
    CGFloat textH = 30;
    
    CGFloat lineX = 10;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * lineX;
    CGFloat lineH = 1;
    
    for (int i = 0; i < self.labels.count; i++) {
        UILabel *label = [self.labels objectAtIndex:i];
        labelY = 84 + i * (labelH + padding);
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        HospitalEnterTextField *textfield = [self.textFields objectAtIndex:i];
        textX = CGRectGetMaxX(label.frame) + padding;
        textY = labelY + 6;
        textfield.frame = CGRectMake(textX, textY, textW, textH);
        
        UIView *line = [self.underlines objectAtIndex:i];
        lineY = CGRectGetMaxY(textfield.frame) + padding;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
- (HospitalEnterTextField *)addTextFieldWithPlaceholder:(NSString *)placeholder
{
    HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
    textfield.borderStyle = UITextBorderStyleNone;
    textfield.placeholder = placeholder;
    [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:textfield];
    return textfield;
}
- (UIView *)addLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    return line;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
        {
            ActionSheetDatePicker *datePicker = [ActionSheetDatePicker dataPickerWithTitle:@"选择时间"
                                                                            datePickerMode:UIDatePickerModeDate
                                                                                doneBlocke:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
                NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
                dateFormater.dateFormat = @"yyyy-MM-dd";
                NSString *dateStr = [dateFormater stringFromDate:selectedDate];
                textField.text = dateStr;
            }
                                                                               cancelBlock:^(ActionSheetDatePicker *picker) {
                
            }
                                                                                    origin:textField];
            [datePicker showActionSheetPicker];
            return NO;
        }
        case 2:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                              delegate:[[DepartmentDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 3:
        {
              ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择职称"
                                                                                              delegate:[[CareerDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        default:
            return YES;
    }
}
@end

























