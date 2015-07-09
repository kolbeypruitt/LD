//
//  AppendCaseController.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "BaseResult.h"
#import "LDNotification.h"
#import "AppendCaseController.h"
#import "MBProgressHUD+MJ.h"
#import "ReleaseCaseTool.h"
#import "ReleaseCaseParam.h"
#import "LDEnterData.h"
#import "ActionSheetCustomPicker+LD.h"
#import "SexDelegate.h"
#import "DepartmentDelegate.h"
#import "HospitalEnterTextField.h"
#import "UITextField+LD.h"
#import "UILabel+LD.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDTextView.h"
@interface AppendCaseController ()<UITextFieldDelegate,UIScrollViewDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,strong) NSMutableArray *textfields;
@property (nonatomic,strong) NSMutableArray *textViews;
@end

static const int textfieldCount = 4;
static const int textViewCount = 8;
@implementation AppendCaseController
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (NSMutableArray *)textfields
{
    if (_textfields == nil) {
        _textfields = [NSMutableArray array];
    }
    return _textfields;
}
- (NSMutableArray *)textViews
{
    if (_textViews == nil) {
        _textViews = [NSMutableArray array];
    }
    return _textViews;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(commit) title:@"提交"];
    self.title = @"发布病例";
    self.scrollView.contentSize = CGSizeMake(0, self.scrollView.frame.size.height * 2.5);
    self.scrollView.backgroundColor = BGCOLOR;
}
- (void)commit
{
    
    self.scrollView.delegate = nil;
    if ( [self messageIsComplete]) {
        ReleaseCaseParam *param =  [self fillParam];
        __weak typeof(self) weakSelf = self;
        [ReleaseCaseTool releaseCaseWithParam:param success:^(BaseResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                [DefaultCenter postNotificationName:RELEASECASESUCCESSNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                [MBProgressHUD showError:@"发布失败!"];
                weakSelf.scrollView.delegate = weakSelf;
            }
        } failure:^(NSError *error) {
                weakSelf.scrollView.delegate = weakSelf;
                [MBProgressHUD showError:@"发布失败!"];
        }];
    }
}
- (void)addCustomViews
{
    NSArray *titleLabels = @[@"性别",@"真实姓名",@"年龄",@"科室",@"主诉",@"现病史",@"既往病史",@"查体",@"辅助检查",@"诊断",@"治疗过程",@"病例介绍"];
    NSArray *placeholder = @[@"请点击选择",@"请输入真实姓名",@"请输入年龄",@"请点击选择"];
    
    //添加标签
    for (int i = 0; i < titleLabels.count; i++) {
        UILabel *titleLabel = [UILabel labelWithTitle:[titleLabels objectAtIndex:i]
                                                 font:15
                                            textColor:[UIColor blackColor]];
        [self.scrollView addSubview:titleLabel];
        [self.labels addObject:titleLabel];
        //添加分割线
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor grayColor];
        [self.lines addObject:line];
        [self.scrollView addSubview:line];
    }
    
    //添加textfield
    for (int i = 0; i < placeholder.count; i++) {
        HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
        textfield.textAlignment = NSTextAlignmentRight;
        textfield.placeholder = [placeholder objectAtIndex:i];
        textfield.tag = i;
        textfield.delegate = self;
        textfield.font = [UIFont systemFontOfSize:15];
        [textfield setValue:textfield.font forKeyPath:@"_placeholderLabel.font"];
        [self.scrollView addSubview:textfield];
        [self.textfields addObject:textfield];
    }
    
    //添加textview
    for (int i = 0; i < titleLabels.count - placeholder.count; i++) {
        LDTextView *textView = [[LDTextView alloc] init];
        textView.delegate = self;
        textView.placeholder = @"请介绍详细";
        [self.textViews addObject:textView];
        [self.scrollView addSubview:textView];
    }
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    CGFloat titleX = 10;
    CGFloat titleY = 0;
    CGFloat titleW = 60;
    CGFloat titleH = 30;
    
    CGFloat textfX = 0;
    CGFloat textfY = 0;
    CGFloat textfW = 0;
    CGFloat textfH = 30;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    CGFloat textvX = 2 * padding + titleW;
    CGFloat textvY = 0;
    CGFloat textvW = SCREENWIDTH -  2 * padding - titleW - padding;
    CGFloat textvH = 140;
    
    
    //textfield
    for (int i = 0 ; i < textfieldCount; i++) {
        UILabel *titleLabel = self.labels[i];
        titleY = i * (titleH + lineH +  padding) + padding;
        titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
     
        HospitalEnterTextField *textField = self.textfields[i];
        textfX = CGRectGetMaxX(titleLabel.frame) + padding;
        textfY = titleY;
        textfW = SCREENWIDTH - textfX - padding;
        textField.frame = CGRectMake(textfX, textfY, textfW, textfH);
        
        UIView *line = self.lines[i];
        lineY = CGRectGetMaxY(titleLabel.frame) + padding;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
    }
    //textView
    UIView *lastLine = self.lines[textfieldCount - 1];
    CGFloat lastLineY = CGRectGetMaxY(lastLine.frame);
    for (int i = 0 ; i < textViewCount; i++) {
        LDTextView *textView = self.textViews[i];
        textvY = i * (textvH + padding + lineH) + lastLineY + padding;
        textView.frame = CGRectMake(textvX, textvY, textvW, textvH);
        
        UIView *line = self.lines[textfieldCount + i];
        lineY = CGRectGetMaxY(textView.frame) + padding/2;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
        UILabel *titleLabel = self.labels[textfieldCount + i];
        titleY = textvY;
        titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    }
}
#pragma scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.scrollView endEditing:YES];
}
#pragma uitextView delegate
- (void)textViewDidBeginEditing:(LDTextView *)textView
{
    [textView showPlaceHolder:NO];
}
- (void)textViewDidEndEditing:(LDTextView *)textView
{
    if (textView.text.length) {
        return;
    }
    [textView showPlaceHolder:YES];
}
#pragma mark - uitextfield delegate
- (BOOL)textFieldShouldBeginEditing:(HospitalEnterTextField *)textField
{
    switch (textField.tag) {
        case 0:
        {
            ActionSheetCustomPicker *picker = [ActionSheetCustomPicker customPickerWithTitle:@"选择性别"
                                                                                    delegate:[[SexDelegate alloc] init]
                                                                                      origin:textField];
            [picker showActionSheetPicker];
            return NO;
            break;
        }
        case 3:
        {
            ActionSheetCustomPicker *picker = [ActionSheetCustomPicker customPickerWithTitle:@"选择性别"
                                                                                    delegate:[[DepartmentDelegate alloc] init]
                                                                                      origin:textField];
            [picker showActionSheetPicker];
            return NO;
            break;
        }
        default:
            return YES;
            break;
    }
}
#pragma 检查表单
- (BOOL)messageIsComplete
{
    NSArray *textfErrorMsg = @[@"请选择性别",@"请输入真实姓名",@"请输入年龄",@"请选择科室"];
    for ( int i = 0; i < textfieldCount; i++) {
        HospitalEnterTextField *textfield = self.textfields[i];
        if (textfield.text.length == 0) {
            [MBProgressHUD showError:[textfErrorMsg objectAtIndex:i]];
            return NO;
        }
    }
    NSArray *viewErrorMsg = @[@"请输入主诉",@"请输入现病史",@"请输入既往病史",@"请输入查体",@"请输入辅助查体",@"请输入诊断",@"请输入治疗过程",@"请输入病例介绍"];
    for ( int i = 0; i < textViewCount; i++) {
        LDTextView *textView = self.textViews[i];
        if (textView.text.length == 0) {
            [MBProgressHUD showError:[viewErrorMsg objectAtIndex:i]];
            return NO;
        }
    }
    return YES;
}
- (ReleaseCaseParam *)fillParam
{
    int gender = [[self.textfields[0] enterData] gender];
    NSString *name = [self.textfields[1] text];
    int age = [[self.textfields[2] text] intValue];
    int department = [[self.textfields[3] enterData] department];
    NSString *chiefComplaint =  [self.textViews[0] text];
    NSString *illNow = [self.textViews[1] text];
    NSString *illBefore = [self.textViews[2] text];
    NSString *bodyCheck = [self.textViews[3] text];
    NSString *supportCheck = [self.textViews[4] text];
    NSString *diagnose = [self.textViews[5] text];
    NSString *treatmentProcess = [self.textViews[6] text];
    NSString *detail = [self.textViews[7] text];
    
    ReleaseCaseParam *param = [[ReleaseCaseParam alloc] init];
    param.gender = gender;
    param.name = name;
    param.age = age;
    param.department = department;
    param.chiefComplaint = chiefComplaint;
    param.illNow = illNow;
    param.illBefore = illBefore;
    param.bodyCheck = bodyCheck;
    param.supportCheck = supportCheck;
    param.diagnose = diagnose;
    param.treatmentProcess = treatmentProcess;
    param.detail = detail;
    return param;
}
@end


















