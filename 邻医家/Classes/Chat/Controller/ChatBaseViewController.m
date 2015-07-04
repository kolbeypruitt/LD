//
//  ChatBaseViewController.m
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ChatToolView.h"
#import "MessageFrame.h"
#import "MessageCell.h"
#import "ChatBaseViewController.h"
#import "UCSCommonClass.h"
@interface ChatBaseViewController () <UITableViewDelegate,UITableViewDataSource>
@end

@implementation ChatBaseViewController
- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        _messageFrames = [NSMutableArray array];
    }
    return _messageFrames;
}
- (instancetype)init
{
    if(self = [super init])
    {
        [self addCustomViews];
        [self layoutCustomViews];
        [self setNotification];
    }
    return self;
}
- (void)setNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)layoutCustomViews
{
    CGFloat chatX = 0;
    CGFloat chatH = 44;;
    CGFloat chatY = self.view.frame.size.height - chatH;
    CGFloat chatW = self.view.frame.size.width;
    self.chatView.frame = CGRectMake(chatX, chatY, chatW, chatH);
    
    CGFloat tableX = chatX;
    CGFloat tableY = 0;
    CGFloat tableW = chatW;
    CGFloat tableH = self.view.frame.size.height - chatH - tableY;
    self.messageView.frame = CGRectMake(tableX, tableY, tableW, tableH);
}
- (void)addCustomViews
{
    UITableView *messageView = [[UITableView alloc] init];
    messageView.separatorStyle = UITableViewCellSeparatorStyleNone;
    messageView.allowsSelection = NO;
    messageView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    [self.view addSubview:messageView];
    self.messageView = messageView;
    [self setupMessageView];
    
    
    ChatToolView *chatView = [ChatToolView chatToolView];
    [self.view addSubview:chatView];
    chatView.inputView.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
    chatView.inputView.leftViewMode  = UITextFieldViewModeAlways;
    self.chatView = chatView;
}
- (void)setupMessageView
{
    //添加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [_messageView addGestureRecognizer:tapGesture];
    
    //设置代理
    _messageView.delegate = self;
    _messageView.dataSource = self;
}
#pragma mark - 键盘处理
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    self.view.window.backgroundColor = self.messageView.backgroundColor;
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
}
- (void)dismissKeyboard:(UITapGestureRecognizer *)gesture
{
    [self.chatView endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - table delegate and datasource 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.chatView endEditing:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   MessageFrame *msgFrame = self.messageFrames[indexPath.row];
    MessageCell *cell = [MessageCell cellWithTableView:tableView];
    cell.messageFrame = msgFrame;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageFrame *msgFrame = self.messageFrames[indexPath.row];
    return msgFrame.cellHeight;
}



@end
