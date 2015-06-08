//
//  WelcomeHosController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HospitalEnterParam.h"
#import "HospitalEnteredController.h"
#import "IWCommon.h"
#import "AFNetworking.h"
#import "LDFormData.h"
#import "HospitalEnterTextField.h"
#import "Common.h"
#import "HospitalEnterResult.h"
#import "LDEnterData.h"
#import "UIImage+MJ.h"
#import "MBProgressHUD+MJ.h"
#import "ZonePickerDelegate.h"
#import "PropertyPickerDelegate.h"
#import "WelcomeHosController.h"
#import "ReviewController.h"
#import "Province.h"
#import "HospitalEnterTool.h"
#import "ActionSheetCustomPicker+LD.h"
#import "MJExtension.h"
@interface WelcomeHosController () <UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSString *_lastZone;
    NSString *_currentZone;
}
@property (nonatomic,weak) UIButton  *auditBtn;
@property (nonatomic,weak) UIButton *uploadBtn;
@property (nonatomic,weak) UIPickerView *propertyPicker;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *textfields;
@end

@implementation WelcomeHosController
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
    [self setupSubviews];
    [self layoutCustomSubviews];
}

- (void)setup
{
    self.title = @"欢迎医院管理者入驻";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)]];
}
- (void)viewTaped:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
}


- (void)setupSubviews
{
    NSArray *labelArray = @[@"医院名称",@"医院地区",@"医院地址",@"医院性质",@"税务登记号",@"真实姓名",@"身份证号",@"上传附件"];
    NSArray *placeholderArray = @[@"请输入医院名称",@"请点击选择地区",@"请输入地址",@"请点击选择性质",@"请输入税务登记号",@"请输入姓名",@"请输入身份证号",@""];
    NSInteger count = labelArray.count;
    for (int i = 0; i < count; i++) {
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
        [self.textfields addObject:textfield];
    }
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
#pragma mark - UIImagePickerController Delegate Method
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.uploadBtn setImage:image forState:UIControlStateNormal];
}
- (void)auditBtnClicked
{
    
     HospitalEnteredController *vc = [[HospitalEnteredController alloc] init];
    self.view.window.rootViewController = vc;
    NSArray *msg = @[@"请输入医院名称",@"请选择地区",@"请输入地址",@"请选择性质",@"请输入税务登记号",@"请输入姓名",@"请输入身份证号"];
    for (int i = 0 ; i < self.textfields.count - 1; i++) {
        HospitalEnterTextField *textfield = [self.textfields objectAtIndex:i];
        if (textfield.text.length == 0) {
            [MBProgressHUD showError:[msg objectAtIndex:i]];
            return;
        }
    }
    HospitalEnterTextField *cityTextField = [self.textfields objectAtIndex:1];
    HospitalEnterTextField *hospitalProperty = [self.textfields objectAtIndex:3];
    int cityId = cityTextField.enterData.hospitalLocation;
    int hospitalLevel = hospitalProperty.enterData.hospitalLevel;
    HospitalEnterParam *param = [HospitalEnterParam paramWithHosName:[[self.textfields objectAtIndex:0] text]
                                                            location:cityId
                                                               taxNo:[[self.textfields objectAtIndex:4] text]
                                                               level:hospitalLevel
                                                             address:[[self.textfields objectAtIndex:2] text]
                                                            realname:[[self.textfields objectAtIndex:5] text]
                                                            idcardNo:[[self.textfields objectAtIndex:6] text]];
    NSData *data = UIImageJPEGRepresentation([self.uploadBtn currentImage], 1.0);
    LDFormData *formData = [LDFormData formDataWithData:data name:@"file" filename:@"" mimiType:@"image/jpeg"];
    NSArray *formDataArray = @[formData];
    [HospitalEnterTool uploadHospitalDataWithParam:param
                                     formDataArray:formDataArray
                                           success:^(HospitalEnterResult *result)
                                                    {
                                                        if ([result.status isEqualToString:@"S"]) {
                                                            NSLog(@"You are amazing!!!");
                                                            self.view.window.rootViewController = [[HospitalEnteredController alloc] init];
                                                        }
                                                        NSLog(@"%@",result.errorCode);
                                                    }
                                           failure:^(NSError *error) {
        
                                           }];
}
- (void)layoutCustomSubviews
{
    CGFloat padding = 6;
    CGFloat verticalBorder = 30;
    CGFloat labelX = 10;
    CGFloat labelY = 0;
    CGFloat labelW = 70;
    CGFloat labelH = 20;
    CGFloat textfieldW = 0;
    CGFloat textfieldH = 30;
    CGFloat textfieldX = 0;
    CGFloat textfieldY = 0;
    
    
    for (int i = 0; i < self.labels.count; i++) {
        UILabel *lb = [self.labels objectAtIndex:i];
        UITextField *textfield = [self.textfields objectAtIndex:i];
        labelY = i * (labelH + verticalBorder) + 84;
//        if (i ==  0) {
//            labelY += 64;
//        }
        lb.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        textfieldX = CGRectGetMaxX(lb.frame) + padding;
        textfieldY = labelY - 2;
        textfieldW = self.view.frame.size.width - textfieldX - padding;
        textfield.frame = CGRectMake(textfieldX, textfieldY, textfieldW, textfieldH);
    }
    HospitalEnterTextField *lastTextfield = [self.textfields lastObject];
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
#pragma mark - textfield delegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(HospitalEnterTextField *)textField
{
    if (textField.tag == 1 || textField.tag == 3) {
        switch (textField.tag) {
            case 1:
            {
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择地区"
                                                                                      delegate:[[ZonePickerDelegate alloc] init]
                                                                                        origin:textField];
                [customPicker showActionSheetPicker];
                break;
            }
            case 3:
            {
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择医院性质" delegate:[[PropertyPickerDelegate alloc] init] origin:textField];
                [customPicker showActionSheetPicker];
                break;
            }
            default:
                break;
        }
        return NO;
    }else
    {
        return YES;
    }
        
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end












