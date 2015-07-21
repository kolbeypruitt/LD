//
//  CheckInForgetController.m
//  邻医家
//
//  Created by Daniel on 15/5/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "CheckInForgetController.h"
#import "BaseResult.h"
#import "MBProgressHUD+MJ.h"
#import "LoginTool.h"
#import "ChangParam.h"
#import "IWCommon.h"
@interface CheckInForgetController ()
@property (weak, nonatomic) IBOutlet UILabel *telnumLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UITextField *checkField;
@property (weak, nonatomic) IBOutlet UITextField *firstPwdField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdField;

@end

@implementation CheckInForgetController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写短信验证码";
    self.telnumLabel.text = self.telnum;
    [self.nextBtn setBackgroundColor:IWColor(88, 202, 203)];
}
- (IBAction)nextStep:(id)sender {
    if ([self messageComplete]) {
        self.nextBtn.enabled = NO;
        ChangParam *param = [ChangParam paraWithTelnum:self.telnum code:self.checkField.text password:self.firstPwdField.text];
        
        __weak typeof(self) weakSelf = self;
        
        [LoginTool changePWDWithParam:param success:^(BaseResult *result) {
            if([result.status isEqualToString:@"S"])
            {
                const int count = weakSelf.navigationController.childViewControllers.count;
                UIViewController *loginVC = weakSelf.navigationController.childViewControllers[count - 3];
                [weakSelf.navigationController popToViewController:loginVC animated:YES];
            }else
            {
                [MBProgressHUD showError:@"密码修改失败!"];
                weakSelf.nextBtn.enabled = YES;
            }
        } failure:^(NSError *error) {
                [MBProgressHUD showError:@"请求网络失败!"];
                weakSelf.nextBtn.enabled = YES;
        }];
    }
}
- (BOOL)messageComplete
{
    if (self.checkField.text.length == 0) {
        [MBProgressHUD showError:@"请填写验证码"];
        return NO;
    }
    if (self.firstPwdField.text.length == 0 || self.confirmPwdField.text.length == 0) {
        [MBProgressHUD showError:@"请输入6位密码"];
        return NO;
    }else
    {
        if (![self.firstPwdField.text isEqualToString:self.confirmPwdField.text]) {
            [MBProgressHUD showError:@"请输入相同密码"];
            return NO;
        }
        else{
            return YES;
        }
    }
}
@end
