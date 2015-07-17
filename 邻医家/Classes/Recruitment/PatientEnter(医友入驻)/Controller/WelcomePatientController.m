//
//  WelcomePatientController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PatientEnterTool.h"
#import "BaseResult.h"
#import "LDInputMessage.h"
#import "IWCommon.h"
#import "Common.h"
#import "LDFormData.h"
#import "WelcomePatientController.h"
#import "HospitalEnterTextField.h"
#import "PatientTabbarController.h"
#import "UIImage+MJ.h"
#import "MBProgressHUD+MJ.h"
#import "ZonePickerDelegate.h"
#import "ReviewController.h"
#import "ActionSheetCustomPicker+LD.h"
#import "PatientEnterParam.h"
@interface WelcomePatientController () <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak) UIButton *auditBtn;
@property (nonatomic,weak) UIButton *uploadBtn;

@end

@implementation WelcomePatientController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)auditBtnClicked
{
    PatientTabbarController *newrootVC = [[PatientTabbarController alloc] init];
    self.view.window.rootViewController = newrootVC;
    
//    PatientEnterParam *param = [self getparam];
    NSData *data = UIImageJPEGRepresentation([self.uploadBtn currentImage], 1.0);
    LDFormData *formData = [LDFormData formDataWithData:data name:@"file" filename:@"" mimiType:@"image/jpeg"];
    NSArray *formDataArray = @[formData];
    [PatientEnterTool uploadPatientDataWithParam:nil formDataArray:formDataArray success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            NSLog(@"You are amazing!!!");
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"上传数据失败"];
    }];
    
}
//- (PatientEnterParam *)getparam
//{
//    NSString *name = [[self.textFields firstObject] text];
//    NSString *idcardNo = [[self.textFields objectAtIndex:1] text];
//    int location = [[[self.textFields objectAtIndex:2] enterData] hospitalLocation];
//    NSString *address = [[self.textFields objectAtIndex:3] text];
//    PatientEnterParam *param = [PatientEnterParam paramWithName:name
//                                                       idcardNo:idcardNo
//                                                       location:location
//                                                        address:address];
//    return param;
//}
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

- (void)setup
{
    self.title = @"欢迎医友入驻";
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)]];
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"真实姓名" placeHolder:@"请输入真实姓名" optionDelegate:nil];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"身份证号" placeHolder:@"请输入身份证号" optionDelegate:nil];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"地区" placeHolder:@"请选择地区" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入详细地址" optionDelegate:nil];
    self.inputMessages = @[message0,message1,message2,message3];
}
- (void)viewTaped:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
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
