//
//  AppendInviteViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//


#define COUNT 12
#import "AppendInviteParam.h"
#import "BaseResult.h"
#import "AppendInviteTool.h"
#import "MBProgressHUD+MJ.h"
#import "AppendInviteViewController.h"
#import "Common.h"
#import "AppendInviteView.h"
@interface AppendInviteViewController () <ApppendInviteViewDelegate>
@property (nonatomic,weak) AppendInviteView *appendView;
@end
@implementation AppendInviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupKeyboard];
}

- (void)setup
{
    self.title = @"增加自由请医";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = nil;
    [self addCustomViews];
}
- (void)addCustomViews
{
    AppendInviteView *appendView = [[AppendInviteView alloc] initWithFrame:self.view.bounds];
    appendView.delegate = self;
    [self.view addSubview:appendView];
    self.appendView = appendView;
}
- (void)appendView:(AppendInviteView *)appendView commitedData:(AppendInviteParam *)dataParam
{
    [AppendInviteTool appendInviteWithParam:dataParam
                                    success:^(BaseResult *result) {
                                        if ([result.status isEqualToString:SUCCESSSTATUS]) {
                                            [DefaultCenter postNotificationName:FREEINVITENEEDREFRESHNOTIFICATION object:self];
                                            [self.navigationController popViewControllerAnimated:YES];
                                        }
                                    } failure:^(NSError *error) {
                                        [MBProgressHUD showError:@"请求网络失败!"];
                                    }];
}
#pragma mark - keyboard related
- (void)setupKeyboard
{
    [DefaultCenter addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    self.view.window.backgroundColor = self.view.backgroundColor;
    
    //0.取出键盘动画的时间
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //1.取得键盘最后的frame
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //2.计算控制器view需要平移的距离
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height;
    
    //3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
}
@end























