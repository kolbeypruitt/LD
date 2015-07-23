//
//  WelcomeHosController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDDocProtocolController.h"
#import "LDCopyView.h"
#import "CommitMessage.h"
#import "LDInputMessage.h"
#import "LDInputView.h"
#import "HospitalPlatformController.h"
#import "HospitalEnterParam.h"
#import "Common.h"
#import "LDFormData.h"
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
#import "MJExtension.h"
#import "LDEnterProctolView.h"
@interface WelcomeHosController () <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,LDEnterProctolViewDelegate>
@property (nonatomic,weak) UIButton  *auditBtn;
@property (nonatomic,weak) LDEnterProctolView *protocolView;
@property (nonatomic,weak) UIPickerView *propertyPicker;
@end

@implementation WelcomeHosController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup
{
    self.title = @"欢迎医院管理者入驻";
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)]];
    [self addMessages];
}
- (void)addMessages
{
    self.showUpView = YES;
    
    LDInputMessage *messsage0 = [LDInputMessage messageWithFirstTitle:@"医院名称" placeHolder:@"请输入医院名称" optionDelegate:nil];
    LDInputMessage *messsage1 = [LDInputMessage messageWithFirstTitle:@"医院地区" placeHolder:@"请选择医院地区" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *messsage2 = [LDInputMessage messageWithFirstTitle:@"医院地址" placeHolder:@"请输入医院地址" optionDelegate:nil];
    LDInputMessage *messsage3 = [LDInputMessage messageWithFirstTitle:@"医院性质" placeHolder:@"请选择医院性质" optionDelegate:[[PropertyPickerDelegate alloc] init]];
    LDInputMessage *messsage4 = [LDInputMessage messageWithFirstTitle:@"税务登记号" placeHolder:@"请输入税务登记号" optionDelegate:nil];
    LDInputMessage *messsage5 = [LDInputMessage messageWithFirstTitle:@"真实姓名" placeHolder:@"请输入真实姓名" optionDelegate:nil];
    LDInputMessage *messsage6 = [LDInputMessage messageWithFirstTitle:@"身份证号" placeHolder:@"请输入身份证号" optionDelegate:nil];
    
    self.inputMessages = @[messsage0,messsage1,messsage2,messsage3,messsage4,messsage5,messsage6];
    
    [self.uploadView.imageBtn addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
    
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
        
//        HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
//        textfield.placeholder = [placeholderArray objectAtIndex:i];
//        textfield.borderStyle = UITextBorderStyleRoundedRect;
//        textfield.tag = i;
//        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
//        textfield.textAlignment = NSTextAlignmentRight;
//        textfield.font = [UIFont systemFontOfSize:14];
//        [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
//        textfield.textColor = [UIColor blackColor];
//        textfield.delegate = self;
//        [self.view addSubview:textfield];
//        [self.textfields addObject:textfield];
    }
    
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
    [self.self.uploadView.imageBtn setImage:image forState:UIControlStateNormal];
}
- (void)commitBtnClicked
{
    if (![self messageComplete]) {
        return;
    }
    if (!self.protocolView.isChecked) {
        [MBProgressHUD showError:@"须同意入驻协议"];
        return;
    }

    HospitalEnterParam *param = [[HospitalEnterParam alloc] init];
    param.name = [self.commitMessages[0] stringMsg];
    param.location = [self.commitMessages[1] intMsg];
    param.address = [self.commitMessages[2] stringMsg];
    param.level = [self.commitMessages[3] intMsg];
    param.taxNo = [self.commitMessages[4] stringMsg];
    param.realname = [self.commitMessages[5] stringMsg];
    param.idcardNo = [self.commitMessages[6] stringMsg];
    
    NSData *data = UIImageJPEGRepresentation([self.uploadView.imageBtn currentImage], 1.0);
    LDFormData *formData = [LDFormData formDataWithData:data name:@"file" filename:@"" mimiType:@"image/jpeg"];
    NSArray *formDataArray = @[formData];
    [HospitalEnterTool uploadHospitalDataWithParam:param
                                     formDataArray:formDataArray
                                           success:^(HospitalEnterResult *result)
                                                    {
                                                        if ([result.status isEqualToString:@"S"]) {
                                                            
                                                            self.view.window.rootViewController = [[HospitalPlatformController alloc] init];
                                                        }else{
                                                            [MBProgressHUD showError:result.errorMsg];
                                                        }
                                                    }
                                           failure:^(NSError *error) {
                                               [MBProgressHUD showError:@"请求网络失败!"];
                                           }];
}
- (void)addMyTextView
{
    
    //添加协议view
    LDEnterProctolView *proctolView = [[LDEnterProctolView alloc] init];
    proctolView.delegate = self;
    [self.scrollView addSubview:proctolView];
    self.protocolView = proctolView;
    
}
- (void)layoutTextView
{
    CGFloat proX = 0;
    CGFloat proY = CGRectGetMaxY(self.uploadView.frame) + 10;
    CGFloat proW = self.view.frame.size.width;
    CGFloat proH = 30;
    self.protocolView.frame = CGRectMake(proX, proY, proW, proH);
   
    
    //调整commitbtn的frame
    CGRect commitFrame = self.commitBtn.frame;
    commitFrame.origin.y = CGRectGetMaxY(self.protocolView.frame) + 10;
    self.commitBtn.frame = commitFrame;
    
    
    
    //调整scrollview的content size
    self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.commitBtn.frame) + 40);
}
#pragma mark - rewrite method
- (void)addCustomViews
{
    [super addCustomViews];
    [self addMyTextView];
}
- (void)layoutCustomViews
{
    [super layoutCustomViews];
    [self layoutTextView];
}
#pragma mark - textfield delegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark - protocol delegate
- (void)enterProctrolView:(LDEnterProctolView *)proctolView didClickedProctolBtn:(UIButton *)button
{
    LDDocProtocolController *docVC = [[LDDocProtocolController alloc] init];
    docVC.title = @"医院入驻协议详情";
    [self.navigationController pushViewController:docVC animated:YES];
}
@end










