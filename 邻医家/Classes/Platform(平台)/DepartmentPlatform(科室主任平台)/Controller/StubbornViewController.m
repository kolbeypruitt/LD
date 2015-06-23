//
//  StubbornViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDNotification.h"
#import "BaseResult.h"
#import "StubbornViewController.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "HospitalEnterTextField.h"
#import "MBProgressHUD+MJ.h"
#import "IshospitalDelegate.h"
#import "PostConsultParam.h"
#import "NiyaoDelegate.h"
#import "LDEnterData.h"
#import "SingleDepartmentDelegate.h"
#import "ZonePickerDelegate.h"
#import "ActionSheetCustomPicker+LD.h"
#import "ActionSheetDatePicker+LD.h"
#import "PostConsultTool.h"
#import "UIBarButtonItem+ENTER.h"

@interface StubbornViewController () <UITextFieldDelegate>
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *textfields;
@property (nonatomic,strong) NSMutableArray *lines;
@end

@implementation StubbornViewController
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)textfields
{
    if (_textfields == nil) {
        _textfields = [NSMutableArray array];
    }
    return _textfields;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"疑难杂症会诊";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self addCustomViews];
    [self layoutCustomViews];
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(post) title:@"发布"];
}
- (void)post
{
    PostConsultParam *param = [[PostConsultParam alloc] init];
    param.consultationType = 2;
    param.department = [[[self.textfields firstObject] enterData] department];
    param.illness = [[self.textfields objectAtIndex:1] text];
    param.caseAbstract = [[self.textfields objectAtIndex:2] text];
    param.gctime = [[self.textfields objectAtIndex:3] text];
    param.location = [[[self.textfields objectAtIndex:4] enterData] hospitalLocation];
    param.address = [[self.textfields objectAtIndex:5] text];
    param.appointHospital = [[self.textfields objectAtIndex:6] text];
    param.doctorJob = [[self.textfields objectAtIndex:7] text];
    param.isHospital = [[[self.textfields lastObject] enterData] ishospital];
    [PostConsultTool postConsulWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            [DefaultCenter postNotificationName:DEPARTMENTMSGREFRESHNOTIFICATION object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:@"信息不完整,发布失败!"];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"请求网络失败!"];
    }];
}
- (void)addCustomViews
{
    NSArray *labelArray = @[@"选择科室",@"待查疾病名称",@"患者病例摘要",@"会诊约定时间",@"会诊约定地址",@"详细地址",@"医院名称",@"拟邀医生职位",@"是否住院"];
    NSArray *placeholderArray = @[@"请点击选择",@"请输入疾病名称",@"请输入患者病例摘要",@"请点击选择",@"请点击选择",@"请输入详细地址",@"请输入医院名称",@"请点击选择",@"请点击选择"];
    const int count = (int)labelArray.count;
    for (int i = 0 ; i < count; i++) {
        UILabel *label = [[UILabel alloc] init];
        
        label.text = [labelArray objectAtIndex:i];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:label];
        [self.labels addObject:label];
        
        HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
        textfield.placeholder = [placeholderArray objectAtIndex:i];
        textfield.borderStyle = UITextBorderStyleNone;
        textfield.tag = i;
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.textAlignment = NSTextAlignmentRight;
        textfield.textColor = [UIColor blackColor];
        textfield.delegate = self;
        [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        [self.view addSubview:textfield];
        [self.textfields addObject:textfield];
        
        [self.lines addObject:[self addLine]];
    }
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    CGFloat labelX = padding;
    CGFloat labelY = 0;
    CGFloat labelW = 90;
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
        labelY = 84 + i * (labelH + padding)+ 1;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(label.frame) + padding/2;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
        HospitalEnterTextField *textfield = [self.textfields objectAtIndex:i];
        textfX = CGRectGetMaxX(label.frame);
        textfY = labelY + 7;
        textfW = SCREENWIDTH - textfX - padding;
        textfield.frame = CGRectMake(textfX, textfY, textfW, textfH);
        
    }
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
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
        {
             ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                              delegate:[[SingleDepartmentDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 3:
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
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请选择"
                                                                                              delegate:[[NiyaoDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 8:
        {
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请选择"
                                                                                              delegate:[[IshospitalDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        default:
            return YES;
    }
}


@end
