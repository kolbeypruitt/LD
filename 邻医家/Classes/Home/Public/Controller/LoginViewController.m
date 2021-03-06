//
//  LoginViewController.m
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "NSString+Check.h"
#import "HospitalPlatformController.h"
#import "DepartmentPlatformController.h"
#import "IWTabBarViewController.h"
#import "PublicHomeController.h"
#import "DoctorTabbarController.h"
#import "PatientTabbarController.h"
#import "ForgetPassController.h"
#import "UIImage+MJ.h"
#import "Account.h"
#import "AccountTool.h"
#import "SignUpViewController.h"
#import "Common.h"
#import "MBProgressHUD+MJ.h"
#import "IWCommon.h"
#import "LoginViewController.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDTextField.h"
#import "LoginTool.h"
#import "SignUpParam.h"
#import "LoginResult.h"
#import "RSAEncryptor.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet LDTextField *telnumField;
@property (weak, nonatomic) IBOutlet LDTextField *passwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic,strong) RSAEncryptor *rsaEncryptor;
@end

@implementation LoginViewController
- (RSAEncryptor *)rsaEncryptor
{
    if (_rsaEncryptor == nil) {
        RSAEncryptor* rsaEncryptor = [[RSAEncryptor alloc] init];
        NSString* publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
        NSString* privateKeyPath = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
        [rsaEncryptor loadPublicKeyFromFile: publicKeyPath];
        [rsaEncryptor loadPrivateKeyFromFile: privateKeyPath password:@"1234"];    // 这里，请换成你生成p12时的密码
        _rsaEncryptor = rsaEncryptor;
    }
    return _rsaEncryptor;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(signUpBtnClicked) title:@"注册"];
    
    [self.loginBtn setBackgroundColor:IWColor(88, 202, 203)];
    [self setupTitle];
    [self setupTextField];
}

- (void)signUpBtnClicked
{
    SignUpViewController *sign = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:sign animated:YES];
}
- (void)setupTextField
{
    [self.telnumField setupTextFieldWithImage:@"login_img" selImage:@"login_img_focus" delegate:self];
    [self.passwdField setupTextFieldWithImage:@"pwd_img" selImage:@"pwd_img_focus" delegate:self];
}
- (void)setupTitle
{
    self.navigationItem.title = @"登录";
}
- (IBAction)forgetPasswdBtn:(id)sender {
    ForgetPassController *forget = [[ForgetPassController alloc] init];
    [self.navigationController pushViewController:forget animated:YES];
}
- (IBAction)loginBtn:(id)sender {
    if ([self messageComplete]) {
        SignUpParam *param = [SignUpParam paramWithTel:[self.rsaEncryptor rsaEncryptString:self.telnumField.text]
                                                      code:nil
                                                    passwd:[self.rsaEncryptor rsaEncryptString: self.passwdField.text]];
            
        [LoginTool loginWithParam:param success:^(LoginResult *result) {
            if ([result.status isEqualToString:SUCCESSSTATUS]) {
                Account *at = [AccountTool account];
                if (at == nil )
                {
                    at = (Account *)result;
                    [AccountTool saveAccount:at];
                }
                [self chooseRootController];
            }else
            {
                [MBProgressHUD showError:result.errorMsg];
            }
        } failure:^(NSError *error) {
            [MBProgressHUD showError:@"请求网络失败!"];
        }];
    }
}
- (BOOL)messageComplete
{
    if (![self.telnumField.text dg_isPhoneNumber]) {
        [MBProgressHUD showError:@"请输入正确手机号"];
        return NO;
    }
    if (![self.passwdField.text dg_isValidPassword]) {
        [MBProgressHUD showError:@"请输入6位以上密码"];
        return NO;
    }
    return YES;
    
}
- (void)chooseRootController
{
    Account *userAccount = [AccountTool account];
    if (userAccount.type == 0 || userAccount.type == 5)
    {//注册用户
        IWTabBarViewController *publicHome = [[IWTabBarViewController alloc] init];
        self.view.window.rootViewController = publicHome;
    }else if(userAccount.type == 1)
    {//医院管理者
        HospitalPlatformController *hosplat = [[HospitalPlatformController alloc] init];
        self.view.window.rootViewController = hosplat;
    }else if(userAccount.type == 2)
    {//入驻医生
        DoctorTabbarController *doc = [[DoctorTabbarController alloc] init];
        self.view.window.rootViewController = doc;
    } else if(userAccount.type == 3)
    {//入驻医友
        PatientTabbarController *patient = [[PatientTabbarController alloc] init];
        self.view.window.rootViewController = patient;
    }else if (userAccount.type == 4)
    {//科室主任
        DepartmentPlatformController *depart = [[DepartmentPlatformController alloc] init];
        self.view.window.rootViewController = depart;
    }
}

#pragma mark - textfield delegate method
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    LDTextField *te = (LDTextField *)textField;
    te.leftButton.selected = YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    LDTextField *te = (LDTextField *)textField;
    te.leftButton.selected = NO;
}






@end










