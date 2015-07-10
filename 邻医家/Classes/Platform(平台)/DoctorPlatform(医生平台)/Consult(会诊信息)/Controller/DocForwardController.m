//
//  DocForwardController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIBarButtonItem+ENTER.h"
#import "UILabel+LD.h"
#import "ChatViewController.h"
#import "DocForwordModel.h"
#import "Common.h"
#import "MJExtension.h"
#import "DocConsultDetailParam.h"
#import "DocConsultDetailTool.h"
#import "DocForwardController.h"
#import "ConsultMessage.h"
#define COUNT 14
@interface DocForwardController ()
@property (nonatomic,strong) DocForwordModel *model;

@end

@implementation DocForwardController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.title = @"会诊详情";
}
- (void)loadData
{
    DocConsultDetailParam *param = [DocConsultDetailParam paramWithId:self.message.id];
    [DocConsultDetailTool getDocConsultDetailWithParam:param success:^(id result) {
        self.model = [DocForwordModel objectWithKeyValues:result];
    } failure:^(NSError *error) {
        
    }];
}
- (void)setModel:(DocForwordModel *)model
{
    _model = model;
}
- (IBAction)contact:(id)sender {
    ChatViewController *chatVC = [[ChatViewController alloc] init];
    chatVC.clientToChat = self.model.clientNumber;
    [self.navigationController pushViewController:chatVC animated:YES];
}


@end
