//
//  AppendRewardController.m
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "BaseResult.h"
#import "AppendInviteTool.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "AppendRewardView.h"
#import "AppendRewardController.h"

@interface AppendRewardController () <AppendRewardDelegate>

@end

@implementation AppendRewardController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.navigationItem.title = @"增加悬赏请医";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = nil;
    [self addCustomViews];
    [self setupKeyboard];
}
- (void)addCustomViews
{
    AppendRewardView *appendView = [[AppendRewardView alloc] initWithFrame:self.view.bounds];
    appendView.delegate = self;
    [self.view addSubview:appendView];
}
- (void)appendView:(AppendRewardView *)appendView commitedData:(AppendInviteParam *)dataParam
{
    [AppendInviteTool appendInviteWithParam:dataParam success:^(BaseResult *result) {
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
