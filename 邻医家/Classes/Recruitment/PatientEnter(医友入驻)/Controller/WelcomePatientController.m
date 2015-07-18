//
//  WelcomePatientController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDCopyView.h"
#import "CommitMessage.h"
#import "PatientEnterTool.h"
#import "BaseResult.h"
#import "LDInputMessage.h"
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

@end

@implementation WelcomePatientController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)commit
{
    
    
    PatientEnterParam *param = [self getparam];
    NSData *data = UIImageJPEGRepresentation([self.uploadView.imageBtn currentImage], 1.0);
    LDFormData *formData = [LDFormData formDataWithData:data name:@"file" filename:@"" mimiType:@"image/jpeg"];
    NSArray *formDataArray = @[formData];
    [PatientEnterTool uploadPatientDataWithParam:param formDataArray:formDataArray success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            PatientTabbarController *newrootVC = [[PatientTabbarController alloc] init];
            self.view.window.rootViewController = newrootVC;
        }else
        {
            [MBProgressHUD showError:result.errorMsg];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"上传数据失败"];
    }];
    
}
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        [self commit];
    }
}
- (PatientEnterParam *)getparam
{
    NSString *name = [self.commitMessages[0] stringMsg];
    NSString *idcardNo = [self.commitMessages[1] stringMsg];
    int location = [self.commitMessages[2] intMsg];
    NSString *address = [self.commitMessages[3] stringMsg];
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

- (void)setup
{
    self.title = @"欢迎医友入驻";
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)]];
    [self addMessages];
}
- (void)addMessages
{
    self.showUpView =  YES;
    
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"真实姓名" placeHolder:@"请输入真实姓名" optionDelegate:nil];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"身份证号" placeHolder:@"请输入身份证号" optionDelegate:nil];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"地区" placeHolder:@"请选择地区" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入详细地址" optionDelegate:nil];
    self.inputMessages = @[message0,message1,message2,message3];
    
    [self.uploadView.imageBtn addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
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
    [self.uploadView.imageBtn setImage:image forState:UIControlStateNormal];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
