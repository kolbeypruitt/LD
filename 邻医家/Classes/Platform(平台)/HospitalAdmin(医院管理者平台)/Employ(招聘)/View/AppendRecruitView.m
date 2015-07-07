//
//  AppendRecruitView.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MBProgressHUD+MJ.h"
#import "AppendRecruitParam.h"
#import "HospitalEnterTextField.h"
#import "JobTypeDelegate.h"
#import "LDEnterData.h"
#import "ActionSheetCustomPicker+LD.h"
#import "DegreeDelegate.h"
#import "ZonePickerDelegate.h"
#import "Common.h"
#import "FirstDepartmentDelegate.h"
#import "EnglishDelegate.h"
#import "AppendRecruitView.h"
@interface AppendRecruitView () <UITextFieldDelegate,UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *textFields;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,weak) UIButton *commitBtn;
@property (nonatomic,strong) NSMutableArray *labels;
@end
@implementation AppendRecruitView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addCustomViews];
    }
    return self;
}
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)textFields
{
    if (_textFields == nil) {
        _textFields = [NSMutableArray array];
    }
    return _textFields;
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (void)addCustomViews
{
    NSArray *labelArray = @[@"标题",@"职位性质",@"选择科室",@"岗位",@"地点",@"详细地址",@"人数",@"学历",@"外语",@"年龄",@"专业",@"招聘条件"];
    NSArray *placeholderArray = @[@"请输入招聘标题",@"请点击选择",@"请点击选择",@"请输入招聘岗位",@"请点击选择",@"请输入详细地址",@"请输入招聘人数",@"请点击选择",@"请点击选择",@"请输入招聘人员年龄",@"请输入招聘人员专业",@"请输入招聘条件"];
    const int count = (int)labelArray.count;
    //1.scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = IWColor(226, 226,226);
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(0, 1.1 * self.frame.size.height);
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    //2.labels
    for (int i = 0 ; i < count; i++) {
        UILabel *label = [[UILabel alloc] init];
        
        label.text = [labelArray objectAtIndex:i];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self.scrollView addSubview:label];
        [self.labels addObject:label];
        
        HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
        textfield.placeholder = [placeholderArray objectAtIndex:i];
        textfield.borderStyle = UITextBorderStyleNone;
        textfield.tag = i;
        textfield.font = [UIFont systemFontOfSize:14];
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.textAlignment = NSTextAlignmentRight;
        textfield.textColor = [UIColor blackColor];
        textfield.delegate = self;
        [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        [self.scrollView addSubview:textfield];
        [self.textFields addObject:textfield];
        
        [self.lines addObject:[self addLine]];
       
    }
}
- (UIView *)addLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.scrollView addSubview:line];
    return line;
}
- (AppendRecruitParam *)fillParam
{
    AppendRecruitParam *param = [[AppendRecruitParam alloc] init];
    NSString *name = [self.textFields[0] text];
    NSString *jobtype = [self.textFields[1] text];
    int department = [[self.textFields[2] enterData] department];
    NSString *jobname = [self.textFields[3] text];
    int location = [[self.textFields[4] enterData] hospitalLocation];
    NSString *address = [self.textFields[5] text];
    int employNum = [[self.textFields[6] text] intValue];
    NSString *education = [self.textFields[7] text];
    NSString *language = [self.textFields[8] text];
    NSString *age = [self.textFields[9] text];
    NSString *profession = [self.textFields[10] text];
    NSString *introduction = [self.textFields[11] text];
    
    param.name = name;
    param.location = location;
    param.jobtype = jobtype;
    param.department = department;
    param.jobname = jobname;
    param.address = address;
    param.employNum = employNum;
    param.education = education;
    param.language = language;
    param.age = age;
    param.profession = profession;
    param.introduction = introduction;
    return param;
}
- (BOOL)messageCompleted
{
    NSArray *errorMessage = @[@"请输入悬赏金额",@"请输入姓名",@"请输入身份证号",@"请选择性别",@"请输入医院",@"请选择科室",@"请输入诊断",@"请选择地点",@"请输入请医地址",@"请输入医生职位",@"请选择目的",@"请点击选择",@"请输入备注"];
    for (int i = 0; i < self.textFields.count; i++) {
        HospitalEnterTextField *textfield = [self.textFields objectAtIndex:i];
        if (textfield.text.length == 0) {
            [MBProgressHUD showError:[errorMessage objectAtIndex:i]];
            return NO;
        }
    }
    return YES;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = (CGRect){CGPointZero,self.bounds.size};
    CGFloat padding = 10;
    CGFloat labelX = padding;
    CGFloat labelY = 0;
    CGFloat labelW = 120;
    CGFloat labelH = 40;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    CGFloat textfX = 0;
    CGFloat textfY = 0;
    CGFloat textfW = 0;
    CGFloat textfH = 30;
    
    for (int i = 0 ; i < self.lines.count; i++ ) {
        UILabel *label = [self.labels objectAtIndex:i];
        labelY = 10 + i * (labelH + padding)+ 1;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(label.frame) + padding/2;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
        HospitalEnterTextField *textfield = [self.textFields objectAtIndex:i];
        textfX = CGRectGetMaxX(label.frame);
        textfY = labelY + 7;
        textfW = SCREENWIDTH - textfX - padding;
        textfield.frame = CGRectMake(textfX, textfY, textfW, textfH);
        
    }
    
}
#pragma mark - TextField delegate
- (BOOL)textFieldShouldBeginEditing:(HospitalEnterTextField *)textField
{
    switch (textField.tag) {
        case 1:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"职位性质"
                                                                                          delegate:[[JobTypeDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 2:
        {
            FirstDepartmentDelegate *firDelegate = [[FirstDepartmentDelegate alloc] init];
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                          delegate:firDelegate
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 4:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择地区"
                                                                                          delegate:[[ZonePickerDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 7:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择学历"
                                                                                          delegate:[[DegreeDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 8:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"外语"
                                                                                          delegate:[[EnglishDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        default:
            return YES;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self endEditing:YES];
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
//    NSString *fileter = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
//    BOOL canChange = [string isEqualToString:fileter];
//    return canChange;
//}
@end
