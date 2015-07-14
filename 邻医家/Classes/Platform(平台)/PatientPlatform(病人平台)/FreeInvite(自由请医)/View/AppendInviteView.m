//
//  AppendInviteView.m
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "InvitePurposeDelegate.h"
#import "MBProgressHUD+MJ.h"
#import "HospitalEnterTextField.h"
#import "ActionSheetCustomPicker+LD.h"
#import "VipDelegate.h"
#import "SexDelegate.h"
#import "ZonePickerDelegate.h"
#import "DepartmentDelegate.h"
#import "AppendInviteParam.h"
#import "LDEnterData.h"
#import "Common.h"
#import "AppendInviteView.h"
#import "MJExtension.h"
@interface AppendInviteView () <UITextFieldDelegate,UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *textFields;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,weak) UIButton *commitBtn;
@property (nonatomic,strong) NSMutableArray *labels;
@end
@implementation AppendInviteView

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
    NSArray *labelArray = @[@"姓名",@"身份证号",@"性别",@"最后一次就医医院",@"最后一次就医科室",@"最后一次诊断",@"地点",@"邀请医生的专业",@"邀请医生的职位",@"请医目的",@"VIP",@"备注"];
    NSArray *placeholderArray = @[@"请输入姓名",@"请输入身份证号",@"选择性别",@"请输入",@"请点击选择",@"请输入",@"请点击选择",@"请输入请医地址",@"请输入医生职位",@"请点击选择",@"是否需要VIP",@"请输入备注"];
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
        
        UIButton *commitBtn = [[UIButton alloc] init];;
        [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
        commitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        commitBtn.titleLabel.backgroundColor = [UIColor clearColor];
        [commitBtn addTarget:self action:@selector(commitBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        self.commitBtn = commitBtn;
        [self.scrollView addSubview:commitBtn];
    }
}
- (UIView *)addLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.scrollView addSubview:line];
    return line;
}
- (void)commitBtnClicked
{
    if([self messageCompleted])
    {
        NSDictionary *param = [self fillParam];
        if ([self.delegate respondsToSelector:@selector(appendView:commitedData:)]) {
            [self.delegate appendView:self commitedData:param];
        }
        
    }
}
- (NSDictionary *)fillParam
{
    AppendInviteParam *param = [[AppendInviteParam alloc] init];
    NSString *name = [[self.textFields objectAtIndex:0] text];
    NSString *idcardNo = [[self.textFields objectAtIndex:1] text];
    int gender = [[[self.textFields objectAtIndex:2] enterData] gender];
    NSString *lastHospital = [[self.textFields objectAtIndex:3] text];
    NSString *lastDep = [[self.textFields objectAtIndex:4] text];
    NSString *lastDia = [[self.textFields objectAtIndex:5] text];
    NSString *address = [[self.textFields objectAtIndex:6] text];
    NSString *profession = [[self.textFields objectAtIndex:7] text];
    NSString *job = [[self.textFields objectAtIndex:8] text];
    NSString *purpose = [[self.textFields objectAtIndex:9] text];
    int isvip = [[[self.textFields objectAtIndex:10] enterData] isvip];
    NSString *remark = [[self.textFields objectAtIndex:11] text];
    param.type = 1;
    param.name = name;
    param.idcardNo = idcardNo;
    param.gender = gender;
    param.lastHospital = lastHospital;
    param.lastDepartment = lastDep;
    param.lastDiagnose = lastDia;
    param.address = address;
    param.profession = profession;
    param.job = job;
    param.purpose = purpose;
    param.isvip = isvip;
    param.remark = remark;
    NSMutableDictionary *dictparam = [param.keyValues mutableCopy];
    [dictparam setObject:@"ssss" forKey:@"description"];
    return dictparam;
}
- (BOOL)messageCompleted
{
    NSArray *errorMessage = @[@"请输入姓名",@"请输入身份证号",@"请选择性别",@"请输入医院",@"请选择科室",@"请输入诊断",@"请选择地点",@"请输入请医地址",@"请输入医生职位",@"请选择目的",@"请点击选择",@"请输入备注"];
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
    
    UIView *lastline = [self.lines lastObject];
    [self.commitBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.commitBtn.frame = CGRectMake(padding, CGRectGetMaxY(lastline.frame) + padding/2, SCREENWIDTH - 2 * padding, 35);
}
#pragma mark - TextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(HospitalEnterTextField *)textField
{
    switch (textField.tag) {
        case 2:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择性别"
                                                                                          delegate:[[SexDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 4:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                          delegate:[[DepartmentDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 6:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择地区"
                                                                                          delegate:[[ZonePickerDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 9:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请医目的"
                                                                                          delegate:[[InvitePurposeDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        case 10:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"是否需要VIP"
                                                                                          delegate:[[VipDelegate alloc] init]
                                                                                            origin:textField];
            [customPicker showActionSheetPicker];
            return NO;
        }
        default:
            return YES;
    }
}
#pragma mark - scrollview delegate 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self endEditing:YES];
}
@end







