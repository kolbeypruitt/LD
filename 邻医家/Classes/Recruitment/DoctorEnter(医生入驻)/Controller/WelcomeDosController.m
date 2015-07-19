//
//  WelcomeDosController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorTabbarController.h"
#import "LDFormData.h"
#import "BaseResult.h"
#import "ZonePickerDelegate.h"
#import "ReviewController.h"
#import "LDEnterData.h"
#import "DoctorEnterParam.h"
#import "DepartmentDelegate.h"
#import "PropertyPickerDelegate.h"
#import "WelcomeDosController.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "WelcomeDoctor.h"
#import "UIImage+MJ.h"
#import "SecondClass.h"
#import "MJExtension.h"
#import "LDTextView.h"
#import "Department.h"
#import "CareerDelegate.h"
#import "DoctorEnterTool.h"

#import "LDInputMessage.h"
#import "LDCopyView.h"
#import "CommitMessage.h"
#import "LDInputView.h"
#import "LDIntroductionView.h"
@interface WelcomeDosController () <UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak) LDIntroductionView *introducitonView;
@end

@implementation WelcomeDosController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"欢迎医生入驻";
    [self addMessages];
}
- (void)addMessages
{
    self.showUpView = YES;
    
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"真实姓名" placeHolder:@"请输入真实姓名" optionDelegate:nil];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"身份证号" placeHolder:@"请输入身份证号" optionDelegate:nil];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"医院名称" placeHolder:@"请输入医院名称" optionDelegate:nil];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"医院地区" placeHolder:@"请选择地区" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"医院地址" placeHolder:@"请输入地址" optionDelegate:nil];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"临床等级" placeHolder:@"请选择医院等级" optionDelegate:[[PropertyPickerDelegate alloc] init]];
    LDInputMessage *message6 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"请选择科室" optionDelegate:[[DepartmentDelegate alloc] init]];
    LDInputMessage *message7 = [LDInputMessage messageWithFirstTitle:@"临床职称" placeHolder:@"请选择临床职称" optionDelegate:[[CareerDelegate alloc] init]];
    LDInputMessage *message8 = [LDInputMessage messageWithFirstTitle:@"擅长疾病" placeHolder:@"请输入擅长疾病" optionDelegate:nil];
    LDInputMessage *message9 = [LDInputMessage messageWithFirstTitle:@"职业号" placeHolder:@"请输入职业号" optionDelegate:nil];
    LDInputMessage *message10 = [LDInputMessage messageWithFirstTitle:@"手机号" placeHolder:@"请输入手机号" optionDelegate:nil];
    self.inputMessages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10];
    
    [self.uploadView.imageBtn addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
}
- (void)commitBtnClicked
{
    if (![self messageComplete]) {
        return;
    }
    if (self.introducitonView.textView.text.length == 0) {
        [MBProgressHUD showError:@"请输入个人简介"];
        return;
    }
    self.commitBtn.enabled = NO;
    
    NSData *data = UIImageJPEGRepresentation([self.uploadView.imageBtn currentImage], 1.0);
    LDFormData *formData = [LDFormData formDataWithData:data name:@"file" filename:@"" mimiType:@"image/jpeg"];
    NSArray *formDataArray = @[formData];

    DoctorEnterParam *param = [[DoctorEnterParam alloc] init];
    
    param.name = [self.commitMessages[0] stringMsg];
    param.idcardNo = [self.commitMessages[1] stringMsg];
    param.hospitalName = [self.commitMessages[2] stringMsg];
    param.hospitalLocation = [self.commitMessages[3] intMsg];
    param.hospitalAddress = [self.commitMessages[4] stringMsg];
    param.hospitalLevel = [self.commitMessages[5] intMsg];
    param.department = [self.commitMessages[6] intMsg];
    param.techtitle = [self.commitMessages[7] intMsg];
    param.familiarIllness = [self.commitMessages[8] stringMsg];
    param.doctorNo = [self.commitMessages[9] stringMsg];
    param.telnum = [self.commitMessages[10] stringMsg];
    param.introduction = self.introducitonView.textView.text;
    
        [DoctorEnterTool uploadDoctorDataWithParam:param formDataArray:formDataArray  success:^(BaseResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                DoctorTabbarController *newroot = [[DoctorTabbarController alloc] init];
                self.view.window.rootViewController = newroot;
            }else
            {
                [MBProgressHUD showError:result.errorMsg];
                self.commitBtn.enabled = YES;
            }
        } failure:^(NSError *error) {
            [MBProgressHUD showError:@"请求网络失败!"];
            self.commitBtn.enabled = YES;
            
        }];
   
    
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
    [self.uploadView.imageBtn setImage:image forState:UIControlStateNormal];
}
- (void)addMyTextView
{
    LDIntroductionView *introductionView = [[LDIntroductionView alloc] init];
    introductionView.titleLabel.text = @"个人简介";
    introductionView.textView.placeholder = @"请输入个人简介";
    introductionView.textView.delegate = self;
    [self.scrollView addSubview:introductionView];
    self.introducitonView = introductionView;
}
- (void)layoutTextView
{
   //取出最后一个inputview
    LDInputView *lastInputView = [self.inputViews lastObject];
    //设置introductionview的frame
    CGFloat introX = 0;
    CGFloat introY = CGRectGetMaxY(lastInputView.frame) + 10;
    CGFloat introW = lastInputView.frame.size.width;
    CGFloat introH = 150;
    self.introducitonView.frame = CGRectMake(introX, introY, introW, introH);
    
    //调整copyview的frame
    CGRect uploadViewRect = self.uploadView.frame;
    uploadViewRect.origin.y = CGRectGetMaxY(self.introducitonView.frame) + 10;
    self.uploadView.frame = uploadViewRect;
    
    //调整commitbtn的frame
    CGRect commitFrame = self.commitBtn.frame;
    commitFrame.origin.y = CGRectGetMaxY(self.uploadView.frame) + 10;
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
#pragma mark - textView delegate
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
@end













