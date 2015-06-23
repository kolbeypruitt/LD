//
//  FreeForwardController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDNotification.h"
#import "ConsultDetailParam.h"
#import "ForwardDelegate.h"
#import "VipDelegate.h"
#import "MBProgressHUD+MJ.h"
#import "PostConsultTool.h"
#import "IshospitalDelegate.h"
#import "PostConsultParam.h"
#import "NiyaoDelegate.h"
#import "BaseResult.h"
#import "LDEnterData.h"
#import "SingleDepartmentDelegate.h"
#import "ZonePickerDelegate.h"
#import "ActionSheetCustomPicker+LD.h"
#import "ActionSheetDatePicker+LD.h"
#import "PostConsultTool.h"
#import "UIBarButtonItem+ENTER.h"
#import "FreeForwardController.h"
#import "UIBarButtonItem+ENTER.h"
#import "IWCommon.h"
#import "Common.h"
#import "HospitalEnterTextField.h"
@interface FreeForwardController () <UITextFieldDelegate,UIScrollViewDelegate,UITextViewDelegate>
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *textFields;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,weak) UIScrollView *scrollView;
@end

@implementation FreeForwardController
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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"自由转诊";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(post) title:@"发布"];
}
- (void)post
{
    PostConsultParam *param = [[PostConsultParam alloc] init];
    param.consultationType = 4;
    param.patientName = [self.textFields[0] text];
    param.idcardNo = [self.textFields[1] text];
    param.lastHospitalDepartment = [self.textFields[2] text];
    param.department = [[self.textFields[3] enterData] department];
    param.lastDiagnose = [self.textFields[4] text];
    param.hospitalLocationTogo = [[self.textFields[5] enterData] hospitalLocation];
    param.hospitalAddressTogo = [self.textFields[6] text];
    param.profession = [self.textFields[7] text];
    param.doctorJob = [self.textFields[8] text];
    param.isHospital = [[self.textFields[9] enterData] ishospital];
    param.purpose = [self.textFields[10] text];
    param.isvip = [[self.textFields[11] enterData] isvip];
    param.isfirstaid = [[self.textFields[12] enterData] ishospital];
    
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
    NSArray *labelArray = @[@"病人姓名",@"身份证号",@"最后一次就医医院",@"选择科室",@"最后一次医院诊断",@"拟转诊就医地址",@"详细地址",@"接诊医师专业",@"拟邀医生技术职位",@"是否住院",@"转诊目的",@"是否需要VIP",@"是否需要抢救"];
    NSArray *placeholderArray = @[@"请输入真实姓名",@"请输入身份证号",@"请输入医院名称",@"请点击选择",@"请输入诊断详情",@"请点击选择",@"请输入详细地址",@"请输入请医专业",@"请点击选择",@"请点击选择",@"请点击选择",@"请点击选择",@"请点击选择"];
    const int count = (int)labelArray.count;
    //1.scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = IWColor(226, 226,226);
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(0, 1.1 * self.view.frame.size.height);
    [self.view addSubview:scrollView];
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
- (void)layoutCustomViews
{
    self.scrollView.frame = (CGRect){CGPointZero,self.view.bounds.size};
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

#pragma mark - UITextfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 3:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                              delegate:[[SingleDepartmentDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 5:
        {
             ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择地区"
                                                                                              delegate:[[ZonePickerDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 8:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请选择"
                                                                                              delegate:[[NiyaoDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 9:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请选择"
                                                                                              delegate:[[IshospitalDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 11:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请选择"
                                                                                              delegate:[[VipDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 12:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请选择"
                                                                                              delegate:[[IshospitalDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        case 10:
        {
            ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"请选择"
                                                                                              delegate:[[ForwardDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
            return NO;
        }
        default:
            return YES;
    }
}



@end
