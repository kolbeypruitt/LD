//
//  ChatViewController.m
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorResume.h"
#import "MessageFrame.h"
#import "Account.h"
#import "AccountTool.h"
#import "ChatViewController.h"
#import "UCSCommonClass.h"
#import "UCSEvent.h"
#import "UCSService.h"
#import "ChatToolView.h"
#import "UIBarButtonItem+ENTER.h"
@interface ChatViewController () <UITextFieldDelegate,UCSEventDelegate>
@property (nonatomic,strong) UCSService *uscService;
@end

@implementation ChatViewController
- (instancetype)init
{
    if (self = [super init]) {
        [self setupUCService];
        [self setupChatView];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:nil action:nil title:@""];
}
- (void)setClientToChat:(NSString *)clientToChat
{
    _clientToChat = clientToChat;
    self.title = clientToChat;
}
- (void)setupUCService
{
    UCSService *service = [[UCSService alloc] initWithDelegate:self];
    Account *account = [AccountTool account];
    
    NSString *accountSid = @"6647890df44fc55787e94a1649518698";
    NSString *accountToken = @"eae83fba6302c02ce1f22c78d3968876";
    
    [service connect:accountSid
            withAccountToken:accountToken
            withClientNumber:account.clientNumber
               withClientPwd:account.clientPwd];
    self.uscService = service;
}
- (void)setupChatView
{
    self.chatView.inputView.delegate = self;
}
#pragma mark - textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.uscService sendUcsMessage:self.clientToChat andText:textField.text andFilePath:nil andExpandData:1];
    [textField resignFirstResponder];
    textField.text = nil;
    return YES;
}



#pragma mark IM通讯的代理
/********************IM通讯的代理********************/
//收到消息回调
- (void) onReceiveUcsMessage:(UCSReason*) reason withData:(UCSMessage*)msg
{
    MessageFrame *msgFrame = [[MessageFrame alloc] init];
    msgFrame.message = msg;
    [self.messageFrames addObject:msgFrame];
    [self.messageView reloadData];
    [self messagesScrollToLastRow];
}
//发送IM消息回调
-(void)onSendUcsMessage:(UCSReason*)reason  withData:(UCSMessage*)data
{
    MessageFrame *msgFrame = [[MessageFrame alloc] init];
    msgFrame.message = data;
    [self.messageFrames addObject:msgFrame];
    [self.messageView reloadData];
    [self messagesScrollToLastRow];
}
//下载IM附件回调
-(void)onDownloadAttached:(UCSReason*)reason withFilePath:(NSString*)filePath withMsgID:(NSString*)msgID
{
    
}
#pragma mark 初始化函数代理
/********************初始化回调********************/
- (void)onConnectionSuccessful:(NSInteger)result
{
    
}
- (void)onConnectionFailed:(NSInteger)reason
{
    
}
#pragma mark - tableview自动滚动到最后一行
- (void)messagesScrollToLastRow
{
    NSIndexPath *lastPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.messageView scrollToRowAtIndexPath:lastPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
@end
