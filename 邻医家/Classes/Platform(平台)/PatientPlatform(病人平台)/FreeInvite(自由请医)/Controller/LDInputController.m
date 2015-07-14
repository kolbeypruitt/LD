//
//  LDInputController.m
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "CommitMessage.h"
#import "MBProgressHUD+MJ.h"
#import "LDInputController.h"
#import "LDInputMessage.h"
#import "Common.h"
#import "LDInputView.h"
@interface LDInputController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIButton *commitBtn;
@property (nonatomic,strong) NSMutableArray *inputViews;
@end

@implementation LDInputController
- (NSMutableArray *)commitMessages
{
    if (_commitMessages == nil) {
        _commitMessages = [NSMutableArray array];
    }
    return _commitMessages;
}
- (NSMutableArray *)inputViews
{
    if (_inputViews == nil) {
        _inputViews = [NSMutableArray array];
    }
    return _inputViews;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}
- (void)addCustomViews
{
    //添加scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    for (int i = 0; i < self.inputMessages.count; i++) {
        LDInputView *inputView = [[LDInputView alloc] init];
        
        inputView.inputMessage = self.inputMessages[i];
        
        [self.scrollView addSubview:inputView];
        [self.inputViews addObject:inputView];
    }
    [self addCommitBtn];
}
- (void)addCommitBtn
{
    UIButton *commitBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commitBtn setBackgroundColor:IWColor(88, 202, 203)];
    [self.scrollView addSubview:commitBtn];
    self.commitBtn  = commitBtn;
}
- (void)layoutCustomViews
{
    
    CGFloat padding = 10;
    CGFloat inputW = self.view.bounds.size.width;
    CGFloat inputH = 35;
    CGFloat inputX = 0;
    CGFloat inputY = 0;
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake(0, self.inputMessages.count * (inputH + padding) + 100);
   
    for (int i = 0; i < self.inputMessages.count; i++) {
        LDInputView *inputView = self.inputViews[i];
        inputY = i * (inputH + padding) + padding;
        inputView.frame = CGRectMake(inputX, inputY, inputW, inputH);
    }
    
    if (self.commitBtn) {
        LDInputView *lastView = [self.inputViews lastObject];
        CGFloat btnX = 0;
        CGFloat btnY = CGRectGetMaxY(lastView.frame) + padding;
        CGFloat btnW = lastView.frame.size.width;
        CGFloat btnH = lastView.frame.size.height;
        self.commitBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
- (void)setup
{
    self.view.backgroundColor = BGCOLOR;
}
- (void)setInputMessages:(NSArray *)inputMessages
{
    _inputMessages = inputMessages;
    [self addCustomViews];
    [self layoutCustomViews];
}



- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        
    }
}
- (BOOL)messageComplete
{
    [self.commitMessages removeAllObjects];
    
    for (int i = 0; i < self.inputViews.count; i++) {
        LDInputView *inputView = self.inputViews[i];
        UITextField *textfield = inputView.inputField;
        if (textfield.text.length == 0) {
            [MBProgressHUD showError:textfield.placeholder];
            return NO;
        }
        CommitMessage *message = [CommitMessage messageWithStringMsg:textfield.text intMsg:textfield.tag];
        [self.commitMessages addObject:message];
    }
    return YES;
}
@end















