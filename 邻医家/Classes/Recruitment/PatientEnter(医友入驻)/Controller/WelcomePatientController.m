//
//  WelcomePatientController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PatientEnterTool.h"
#import "BaseResult.h"
#import "IWCommon.h"
#import "Common.h"
#import "LDFormData.h"
#import "LDEnterData.h"
#import "WelcomePatientController.h"
#import "HospitalEnterTextField.h"
#import "PatientEnteredController.h"
#import "UIImage+MJ.h"
#import "MBProgressHUD+MJ.h"
#import "ZonePickerDelegate.h"
#import "ReviewController.h"
#import "ActionSheetCustomPicker+LD.h"
#import "PatientEnterParam.h"
@interface WelcomePatientController () <UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak) UIButton *auditBtn;
@property (nonatomic,weak) UIButton *uploadBtn;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *textFields;

@end

@implementation WelcomePatientController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)addCustomViews
{
    NSArray *labelArray = @[@"真实姓名",@"身份证号",@"选择地区",@"详细地址",@"上传附件"];
    NSArray *placeholderArray = @[@"请输入真实姓名",@"请输入身份证号",@"请点击选择地区",@"请输入详细地址",@""];
    for (int i = 0; i < labelArray.count; i++) {
        UILabel *lb = [[UILabel alloc] init];
        lb.text = [labelArray objectAtIndex:i];
        lb.textColor = [UIColor blackColor];
        lb.font = [UIFont systemFontOfSize:14];
        lb.backgroundColor = [UIColor clearColor];
        [self.view addSubview:lb];
        [self.labels addObject:lb];
        
        HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
        textfield.placeholder = [placeholderArray objectAtIndex:i];
        textfield.borderStyle = UITextBorderStyleRoundedRect;
        textfield.tag = i;
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.textAlignment = NSTextAlignmentRight;
        textfield.font = [UIFont systemFontOfSize:14];
        [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        textfield.textColor = [UIColor blackColor];
        textfield.delegate = self;
        [self.view addSubview:textfield];
        [self.textFields addObject:textfield];
        
        UIButton *uploadBtn = [[UIButton alloc] init];
        [uploadBtn setImage:[UIImage imageWithName:@"compose_camerabutton_background"] forState:UIControlStateNormal];
        [uploadBtn addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:uploadBtn];
        self.uploadBtn = uploadBtn;
        
        UIButton *auditBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [auditBtn setTitle:@"审核" forState:UIControlStateNormal];
        [auditBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [auditBtn setBackgroundImage:[UIImage resizedImageWithName:@"reg_btn_bg_blue_big"] forState:UIControlStateNormal];
        [auditBtn addTarget:self action:@selector(auditBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:auditBtn];
        self.auditBtn = auditBtn;
    }
}
- (void)auditBtnClicked
{
    PatientEnteredController *newrootTabVC = [[PatientEnteredController alloc] init];
    self.view.window.rootViewController = newrootTabVC;
    NSArray *placeholderArray = @[@"请输入真实姓名",@"请输入身份证号",@"请点击选择地区",@"请输入详细地址",@""];
    for (int i = 0 ; i < self.textFields.count - 1; i++) {
        HospitalEnterTextField *textfield = [self.textFields objectAtIndex:i];
        if (textfield.text.length == 0) {
            [MBProgressHUD showError:[placeholderArray objectAtIndex:i]];
            return;
        }
    }
    PatientEnterParam *param = [self getparam];
    NSData *data = UIImageJPEGRepresentation([self.uploadBtn currentImage], 1.0);
    LDFormData *formData = [LDFormData formDataWithData:data name:@"file" filename:@"" mimiType:@"image/jpeg"];
    NSArray *formDataArray = @[formData];
    [PatientEnterTool uploadPatientDataWithParam:param formDataArray:formDataArray success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            NSLog(@"You are amazing!!!");
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"上传数据失败"];
    }];
    
}
- (PatientEnterParam *)getparam
{
    NSString *name = [[self.textFields firstObject] text];
    NSString *idcardNo = [[self.textFields objectAtIndex:1] text];
    int location = [[[self.textFields objectAtIndex:2] enterData] hospitalLocation];
    NSString *address = [[self.textFields objectAtIndex:3] text];
    PatientEnterParam *param = [PatientEnterParam paramWithName:name
                                                       idcardNo:idcardNo
                                                       location:location
                                                        address:address];
    return param;
}
- (void)upload
{
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"从手机相册选一张",@"拍一张", nil];
    [actionsheet showFromTabBar:self.tabBarController.tabBar];
}
#pragma mark - actionsheet delegate method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self openPhotoLibraray];
            break;
        case 1:
            [self openCamera];
            break;
        default:
            break;
    }
}
- (void)openCamera
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
- (void)openPhotoLibraray
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
- (void)layoutCustomViews
{
    CGFloat padding = 6;
    CGFloat verticalBorder = 30;
    CGFloat labelX = 10;
    CGFloat labelY = 0;
    CGFloat labelW = 60;
    CGFloat labelH = 20;
    CGFloat textfieldW = 0;
    CGFloat textfieldH = 30;
    CGFloat textfieldX = 0;
    CGFloat textfieldY = 0;
    
    for (int i = 0; i < self.labels.count; i++) {
        UILabel *lb = [self.labels objectAtIndex:i];
        HospitalEnterTextField *textfield = [self.textFields objectAtIndex:i];
        labelY = i *(labelH + verticalBorder) + 84;
        
        lb.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        textfieldX = CGRectGetMaxX(lb.frame) + padding;
        textfieldY = labelY - 2;
        textfieldW = self.view.frame.size.width - textfieldX - padding;
        textfield.frame = CGRectMake(textfieldX, textfieldY, textfieldW, textfieldH);
    }
     HospitalEnterTextField *lastTextfield = [self.textFields lastObject];
    //上传附件按钮
    CGFloat uploadbtnW = 55;
    CGFloat uploadbtnH = 55;
    CGFloat uploadbtnX = SCREENWIDTH - padding - uploadbtnW;
    CGFloat uploadbtnY = lastTextfield.frame.origin.y;
    self.uploadBtn.frame = CGRectMake(uploadbtnX, uploadbtnY, uploadbtnW, uploadbtnH);
    [lastTextfield removeFromSuperview];
    
   //审核按钮
    CGFloat btnW = self.view.frame.size.width - 2 * padding;
    CGFloat btnX = padding;
    CGFloat btnY = CGRectGetMaxY(self.uploadBtn.frame) + verticalBorder;
    CGFloat btnH = textfieldH;
    self.auditBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
}
- (void)setup
{
    self.title = @"欢迎医友入驻";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)]];
}
- (void)viewTaped:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldBeginEditing:(HospitalEnterTextField *)textField
{
    if (textField.tag == 2) {
        ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择地区"
                                                                                      delegate:[[ZonePickerDelegate alloc] init]
                                                                                        origin:textField];
        [customPicker showActionSheetPicker];
        return NO;
    }else
    {
        return YES;
    }
    
}
#pragma mark - UIImagePickerController Delegate Method
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.uploadBtn setImage:image forState:UIControlStateNormal];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
